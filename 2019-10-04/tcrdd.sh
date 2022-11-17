#!/usr/bin/env bash
BRANCH=origin/master
MESSAGE=""

function usage() {
    cat << EOF
Usage :
$0 [-g|-r] testCommand and arguments
The TEST_KEYWORD environment variable is assumed to be set to a regex that, when present in the added code, means a test was just added
EOF
    exit -1
}

function runTest() {
   $CMD
}

# look for a new test in a + line in the diff
function testJustAdded(){
    [[ ! -z `git diff HEAD | grep "^\+.*${TEST_KEYWORD}"` ]]
}

RED_REF=refs/isRed

function commit() {
    if lastCommitRed; then
        if [ ! -z "$MESSAGE" ]; then
            git commit --amend --no-edit -m "$MESSAGE"
        else
            git commit --amend --no-edit --allow-empty-message
        fi
    else
        git commit --allow-empty-message -m "$MESSAGE"
    fi
}

# amend in case of test refactoring (last commit is red, same test)
function commitOnRed() {
    commit && git update-ref ${RED_REF} HEAD
}

# amend if last commit was a test, with no change to the commit message
# in case if last commit was green commit with empty message (/?\ should refactoring have commit messages?)
# remove any RED tag reference
function commitOnGreen() {
    commit && git update-ref -d ${RED_REF}
}

# finds a previous commit tagged Red, returns true if same as current work
function lastCommitRed(){
    [[ `git describe --all ${RED_REF} 2>/dev/null` && -z `git diff ${RED_REF} HEAD 2>/dev/null` ]]
}

# revert to the last version that was committed
function revert() {
    git reset --hard
}

# pull branch if there's a remote change
# rebase so that our commit will come *after* remote changes
function pull(){
    if needsPull; then
        git pull --rebase
    fi
}

# detect remote changes (not actually fetching them)
function needsPull(){
    [[ ! -z `git fetch --dry-run 2>&1` ]]
}

# if push required, launch tests then push
function push() {
    if needsPush; then
        runTest && git push
    fi
}

# detect local changes wrt remote
function needsPush(){
    [[ ! -z `git diff ${BRANCH} HEAD` ]]
}

# main
ASSUMING_GREEN=false
ASSUMING_RED=false

while getopts ":rghim:" opt; do
  case ${opt} in
    g )
      ASSUMING_GREEN=true
      ;;
    r )
      ASSUMING_RED=true
      ;;
    h )
      usage
      ;;
    m )
      MESSAGE="${OPTARG}"
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))

CMD="$@"
if [ -z "$CMD" ] || [ -z "$TEST_KEYWORD" ]
then
    usage
fi

git add .
if ${ASSUMING_RED} || (! ${ASSUMING_GREEN} && testJustAdded)
then
    echo red
    runTest && revert || commitOnRed
    pull
else
    echo green
    runTest && commitOnGreen || revert
    pull && push
fi


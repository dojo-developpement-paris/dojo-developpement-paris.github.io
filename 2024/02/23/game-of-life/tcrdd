#!/usr/bin/env bash
MESSAGE=""

function usage() {
    cat << EOF
Usage :
$0 [options...] testCommand [arguments...]

Options:
    -l, --local             local mode : do not push nor pull
    -g, --green             assume the tests will pass
    -r, --red               assume the tests will fail
    -m, --message MESSAGE   use the provided commit message
EOF
    exit -1
}

function runTest() {
   $CMD
}

RED_REF=refs/isRed

function commit() {
    if lastCommitRed; then
        git commit --amend --no-edit --allow-empty-message -m "$MESSAGE"
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
    ${ASSUMING_REMOTE} && [[ ! -z `git fetch --dry-run 2>&1` ]]
}

# if push required, launch tests then push
function push() {
    if needsPush; then
        runTest && git push
    fi
}

# detect local changes wrt remote
function needsPush(){
    ${ASSUMING_REMOTE} && [[ ! -z `git diff @{push}` ]]
}

# main
ASSUMING_GREEN=false
ASSUMING_RED=false
ASSUMING_REMOTE=true

OPTIONS=`getopt -o lgrhm: --long local,green,red,help,message: -n "$(basename $0)" -- "$@"`

eval set -- "${OPTIONS}"

if [ $? != 0 ]
then
    usage
fi

while true; do
  case $1 in
    -l | --local )
      ASSUMING_REMOTE=false
      shift
      ;;
    -g | --green )
      ASSUMING_GREEN=true
      shift
      ;;
    -r | --red )
      ASSUMING_RED=true
      shift
      ;;
    -h | --help )
      usage
      shift
      ;;
    -m | --message )
      MESSAGE="$2"
      shift 2
      ;;
    -- ) # Stop processing options
      shift
      break
      ;;
    * )
      break
      ;;
  esac
done

CMD="$@"
if [ -z "$CMD" ]
then
    usage
fi

git add .
if ${ASSUMING_RED}
then
    runTest && revert || commitOnRed
    pull
else
    runTest && commitOnGreen || revert
    pull && push
fi


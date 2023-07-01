#!/usr/bin/env bash
BRANCH=origin/master
TEST_KEYWORD="shouldBe"

function runTest() {
    runhaskell Specs.hs
}

function testJustAdded(){
    [[ ! -z `git diff HEAD | grep "^\+.*${TEST_KEYWORD}"` ]]
}

RED_REF=refs/isRed

function commitRed() {
    git add . && \
    if lastCommitRed; then
        git commit --amend
    else
        git commit
    fi && \
    git update-ref ${RED_REF} HEAD
}

function commitGreen() {
    git add . && \
    if lastCommitRed; then
        git commit --amend --no-edit
    else
        git commit --allow-empty-message -m ""
    fi && \
    git update-ref -d ${RED_REF}
}

function lastCommitRed(){
    [[ `git describe --all ${RED_REF} 2>/dev/null` && -z `git diff ${RED_REF} HEAD 2>/dev/null` ]]
}

function revert() {
    git reset --hard
    git clean -f
}

function pull(){
    if needsPull; then
        git pull --rebase
    fi
}

function needsPull(){
    [[ ! -z `git fetch --dry-run 2>&1` ]]
}

function push() {
    if needsPush; then
        runTest && git push
    fi
}

function needsPush(){
    [[ ! -z `git diff ${BRANCH} HEAD` ]]
}


KNOWN_AS_GREEN=false
KNOWN_AS_RED=false

while [[ $# -gt 0 ]]
do
    key="$1"

    case ${key} in
        -g|--green)
            KNOWN_AS_GREEN=true
            shift
            ;;
        -r|--red)
            KNOWN_AS_RED=true
            shift
            ;;
        *)
            shift
            ;;
    esac
done

if ${KNOWN_AS_RED} || (! ${KNOWN_AS_GREEN} && testJustAdded)
then
    runTest && revert || commitRed
else
    runTest && commitGreen || revert
fi


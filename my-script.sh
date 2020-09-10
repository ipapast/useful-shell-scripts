#!/usr/bin/env bash
set -e

COMMAND=$1

function print () {
    GREEN='\033[0;32m'
    NC='\033[0m'
    echo -e ${GREEN}$1${NC}
}

function printError () {
    RED="\033[0;31m"
    NC='\033[0m'
    echo -e ${RED}$1${NC}
}

function usage () {
    print 'USAGE: \n
     ./my-script.sh doThis (does some stuff) \n
     ./my-script.sh doThat \n'
    exit 1
}

function doThis () {
  print 'Creating blah blah...'
}

function doThat () {
  print 'Updating blah blah...'
}

case ${COMMAND} in
 'doThis') doThisFunction ;;
 'doThat') doThatFunction ;;
 '') usage ;;
 *) printError "Command '${COMMAND}' not supported\n" && usage ;;
esac

#!/bin/sh

FAIL=0

for file in test/* ; do
    NAME=`basename $file`
    echo -n "Testing $NAME ... "
    LOG_LINES=$(logcheck-test -q -i -l $file -r ignore.d/$NAME)
    RESULT=$?
    LOG_COUNT=$(echo -n "$LOG_LINES" | wc -l)
    if [ $RESULT -ne 1 -o $LOG_COUNT -ne 0 ] ; then
        tput setaf 9
        echo FAILED
        tput setaf 3
        echo "$LOG_LINES"
        tput sgr0
        FAIL=$((FAIL + 1))
    else
        tput setaf 10
        echo OK
        tput sgr0
    fi
done

exit $FAIL

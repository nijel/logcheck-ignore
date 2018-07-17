#!/bin/sh

FAIL=0

for file in test/* ; do
    NAME=`basename $file`
    echo -n "Testing $NAME ... "
    RESULT=$(logcheck-test -q -i -l $file -r ignore.d/$NAME | wc -l)
    if [ $RESULT -ne 0 ] ; then
        tput setaf 9
        echo FAILED
        tput sgr0
        logcheck-test -i -l $file -r ignore.d/`basename $file`
        echo
        FAIL=$(($FAIL + 1))
    else
        tput setaf 10
        echo OK
        tput sgr0
    fi
done

exit $FAIL

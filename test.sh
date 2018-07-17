#!/bin/sh

FAIL=0

for file in test/* ; do
    RESULT=$(logcheck-test -q -i -l $file -r ignore.d/`basename $file` | wc -l)
    if [ $RESULT -ne 0 ] ; then
        echo FAILED:
        logcheck-test -i -l $file -r ignore.d/`basename $file`
        echo
        FAIL=$(($FAIL + 1))
    fi
done

exit $FAIL

#!/bin/bash

FAIL=0
RED="\e[91m"
GREEN="\e[92m"
RESET="\e[0m"

for file in test/* ; do
    NAME=$(basename "$file")
    echo -n "Testing $NAME ... "
    LOG_LINES=$(logcheck-test -q -i -l "$file" -r "ignore.d/$NAME")
    RESULT=$?
    LOG_COUNT=$(echo -n "$LOG_LINES" | wc -l)
    if [ "$RESULT" -ne 1 ] || [ "$LOG_COUNT" -ne 0 ] ; then
        echo -e "${RED}FAILED${RESET}"
        echo "$LOG_LINES"
        FAIL=$((FAIL + 1))
    else
        echo -e "${GREEN}OK${RESET}"
    fi
done

exit $FAIL

#!/bin/sh
set -e
cd ignore.d
for name in * ; do
    path="/etc/logcheck/ignore.d.server/nijel-$name"
    if [ ! -f "$path" ] ; then
        ln -s "$(readlink -f "$name")" "$path"
    fi
done

#!/bin/sh
set -e
cd ignore.d
ls | while read name ; do
    path=/etc/logcheck/ignore.d.server/nijel-$name
    if [ ! -f $path ] ; then
        ln -s `readlink -f $name` $path
    fi
done

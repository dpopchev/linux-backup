#!/usr/bin/env bash

PREFIX=/home/dimitar/tmp
SOURCE=$PREFIX/srcdir/
DESTINATION=$PREFIX/dstdir

make_backup_options() {
    local link_dest, exclude_from
    local "${@}"

    local -a options
    options+=( --archive )
    options+=( --acls )
    options+=( --xattrs )
    options+=( --delete )
    options+=( --progress )
    options+=( --verbose )
    options+=( --mkpath )

    if [[ ! -z $link_dest ]]; then
        options+=( --link-dest $link_dest )
    fi

    if [[ ! -z $exclude_from ]]; then
        options+=( --exclude-from $exclude_from )
    fi

    echo "${options[@]}"
}

make_backup_name() {
    echo $(date +%Y-%m-%d-%H-%M-%S)
}

link_last() {
    ln --symbolic --force --no-dereference $1 $2
}

snapshot=$DESTINATION/$(make_backup_name)
options=$(make_backup_options link_dest=$DESTINATION/last)
rsync $options $SOURCE $snapshot
case $? in
    0)
        link_last $snapshot  $DESTINATION/last
        notify-send "$0 success"
        ;;
    *)
        notify-send "$0 failed; $?"
        ;;
esac

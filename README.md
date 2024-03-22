# linux-snapshot

Recipes for backup/snapshots.

## Installation

### Requirements

- rsync

### Install

Make a local copy. Change script variables either by edit or while invoking.

## Usage

Actions will use `$XDG_RUNTIME_DIR` if available by default to save a log file
and store partial transferred files.

### snapshot

Library to make snapshot backups using hard links of unchanged files.
Public API is consisted of `make_snapshot`, `restore_latest` and plain CLI.

`make_snapshot` takes a target and destination to create a differentiated snapshot
with same files 'copied' as hard links. It will delete missing files (only from
the most recent copy) and skip files who are newer on the destination. A symbolic
link is created at the destination pointing to the most recent backup.

`restore_latest` takes as first argument the snapshot home and the original
target as second. It will copy the content of the latest snapshot, pointed by
`$LATEST` into the original place appending the `$RESTORED` value.

Invoking from CLI without arguments makes a snapshot backup of `$TARGET` into
`$SNAPSHOTS` while updating the `$LATEST` symbolic link. Pass `--restore` option
to reverse the process.

### backup

Same as `snapshot` with the difference

- will just make a backup, nothing more
- `BACKUPS` is the environment variable

## Acknowledgment

- [arch wiki](https://wiki.archlinux.org/title/rsync)
- [gentoo wiki](https://wiki.gentoo.org/wiki/Rsync)

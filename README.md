# linux-backup

Make snapshot backups using `rsync`.

## Installation

### Requirements

- `rsync`

### Install

```
git clone --depth 1 https://github.com/dpopchev/linux-backup
cd linux-backup
make install
```

## Usage

### Setup

Add `~/.dpopchev` in your `PATH`, e.g.

```
PATH="~/.dpopchev/:$PATH"
```

### Backup snapshot

```
backup srcdir dstdir
```

#### Hardlink unchanged files

Argument for the `link-dest` option.

```
backup srcdir dstdir link_dest=dstdir/latest
```

#### Exclude

Argument for the `exclude_from` option.

```
backu srcdir dstdir exclude_from=exclude_list
```

Sample exclusion of directories and files content:

```
# exclude_list
/dev/*
/proc/*
/lost+found
/home/user/.npm
/home/user/.cache
```

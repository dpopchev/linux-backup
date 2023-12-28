# linux-snapshot

Make snapshot backups using `rsync` into remote server.

## Installation

### Requirements

- `rsync`
- `sshpass`

### Install

```
git clone --depth 1 https://github.com/dpopchev/linux-snapshot
cd linux-snapshot
make install
```

## Usage

### Setup

#### User wide available

Add `~/.dpopchev` in your `PATH`, e.g.

```
PATH="~/.dpopchev/:$PATH"
```

### Make snapshot

To create a snapshot backup of `targetdir` into `destination` just do

```
snapshot targetdir destinaton
```

After execution in `destination` you will find:

- snapshot of `targetdir` named after time of execution, i.e. `YYYY-MM-DD-H-M-S`
- `latest` pointing to the most recent backup
- unchanged files in between snapshots are hard link copies

In the directory of execution you will see logfile.

#### Exclude

```
snapshot targetdir -l destinaton -e exclude_list
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

### Help

Execute without arguments to see latest description.

## Acknowledgment

- [arch wiki](https://wiki.archlinux.org/title/rsync)
- [gentoo wiki](https://wiki.gentoo.org/wiki/Rsync)

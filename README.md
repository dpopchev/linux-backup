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

#### Exclude

Third argument can be a file with exclusion list

```
snapshot targetdir -l destinaton -e exclude_list -h loaclhost -u user
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

## Acknowledgment

- [arch wiki](https://wiki.archlinux.org/title/rsync)
- [gentoo wiki](https://wiki.gentoo.org/wiki/Rsync)

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

Add `~/.local/bin/dpopchev` in your `PATH`, e.g.

```
PATH="~/.local/bin/dpopchev:$PATH"
```

### Options

Execute with empty parameters

```
snapshot # see short/long option versions
```

### Make local snapshot

To create a snapshot backup of `targetdir` into `destination` just do

```
snapshot -s targetdir -d destinaton
```

After execution in `destination` you will find:

- snapshot of `targetdir` named after time of execution, i.e. `YYYY-MM-DD-H-M-S`
- `latest` pointing to the most recent backup
- unchanged files in between snapshots are hard link copies

In the directory of execution you will see logfile.

### Make remote snapshot

Similar to the local one but with several more flags:

```
snapshot -s targetdir -d destination --is-remote -p sshpass/passfile -u user -h host
```

### Exclude nodes

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

### Restore

Execute the command in reverse with source pointing to `latest`.

## Acknowledgment

- [arch wiki](https://wiki.archlinux.org/title/rsync)
- [gentoo wiki](https://wiki.gentoo.org/wiki/Rsync)

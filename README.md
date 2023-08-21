# Debian OSTree Builder

This is a experimental repo to build Debian OSTree images.

## Build

```bash
$ ./build ostree
```

## Run

Use the `bin/start-vm` script from [gardenlinux](https://github.com/gardenlinux/gardenlinux/blob/main/bin/start-vm).

```bash
$ path/to/gardenlinux/bin/start-vm --no-watchdog .build/ostree-arm64-trixie-local.ostree.raw
```

# Debian OSTree Builder

This is a experimental repo to build Debian OSTree images.

## Build

This repo is built using the [Garden Linux Builder](https://github.com/gardenlinux/builder#builder), which uses podman, see it's readme for setup instructions.

```bash
$ ./build ostree
```

## Run

Use the `bin/start-vm` script from [Garden Linux](https://github.com/gardenlinux/gardenlinux/blob/main/bin/start-vm).

Depending on your architecture, it should look like this:

```bash
$ path/to/gardenlinux/bin/start-vm --no-watchdog .build/ostree-arm64-trixie-local.ostree.raw
```

```bash
$ path/to/gardenlinux/bin/start-vm --no-watchdog .build/ostree-amd64-trixie-local.ostree.raw
```

Check for the actual name of the image in the `.build` directory.

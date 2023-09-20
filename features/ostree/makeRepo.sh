#!/usr/bin/env bash

set -eufo pipefail

# Call this script from the root of the repo as:
# ./features/ostree/makeRepo.sh .build/ostree-arm64-trixie*.tar
# Can be served with this command from the root of the repo:
# docker run --name ostree-repo -v $PWD/.build/ostree-repo:/usr/share/nginx/html:ro -p 8000:80 nginx

OSTREE_REPO=.build/ostree-repo
OSTREE_ROOTFS=.build/ostree-rootfs
# fixme: don't hardcode architecture
OSTREE_REF=debian/testing/arm64

if [ $# -ne 1 ]; then
    echo "Usage: $0 <rootfs tarball>"
    exit 1
fi

ROOTFS_TARBALL=$1

mkdir -p $OSTREE_ROOTFS
mkdir -p $OSTREE_REPO
tar xf "$ROOTFS_TARBALL" --directory=$OSTREE_ROOTFS
ostree init --mode=archive --repo=$OSTREE_REPO
ostree commit --repo=$OSTREE_REPO --branch $OSTREE_REF --skip-if-unchanged -s "Debian testing build $(date)" $OSTREE_ROOTFS

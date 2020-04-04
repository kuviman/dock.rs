#!/usr/bin/sh

set -e

cd /tmp
git clone https://github.com/tpoechtrager/osxcross
cd osxcross
wget -q https://s3.dockerproject.org/darwin/v2/MacOSX10.11.sdk.tar.xz --directory-prefix=tarballs
PORTABLE=yes UNATTENDED=yes OSX_VERSION_MIN=10.7 ./build.sh
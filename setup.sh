#!/bin/bash
EMACSDIR=~/.emacs.d

mkdir -p $EMACSDIR/bin
wget https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py -O $EMACSDIR/bin/cpplint.py
chmod a+x $EMACSDIR/bin/cpplint.py

git clone --recurse-submodules https://github.com/nosami/OmniSharpServer.git /tmp/OmniSharpServer
pushd /tmp/OmniSharpServer
xbuild
mv  OmniSharp/bin/Debug $EMACSDIR/bin/OmniSharp
popd
rm -rf /tmp/OmniSharpServer

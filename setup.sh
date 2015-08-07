#!/bin/bash
EMACSDIR=~/.emacs.d

mkdir -p $EMACSDIR/bin
mkdir -p $EMACSDIR/snippets

wget https://raw.githubusercontent.com/dominikh/go-errcheck.el/master/go-errcheck.el -O $EMACSDIR/conf/go-errcheck.el
wget https://raw.githubusercontent.com/nsf/gocode/master/emacs/go-autocomplete.el -O $EMACSDIR/conf/go-autocomplete.el
wget https://raw.githubusercontent.com/golang/tools/master/cmd/oracle/oracle.el -O $EMACSDIR/conf/oracle.el
wget https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py -O $EMACSDIR/bin/cpplint.py
chmod a+x $EMACSDIR/bin/cpplint.py

git clone --recurse-submodules https://github.com/nosami/OmniSharpServer.git /tmp/OmniSharpServer
pushd /tmp/OmniSharpServer
xbuild
mv  OmniSharp/bin/Debug $EMACSDIR/bin/OmniSharp
popd
rm -rf /tmp/OmniSharpServer

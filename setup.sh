#!/bin/bash
EMACSDIR=$HOME/.emacs.d

mkdir -p $EMACSDIR/bin
mkdir -p $EMACSDIR/snippets

sudo apt-get -y install emacs build-essential clang exuberant-ctags editorconfig libncurses5-dev

npm install -g tern jshint

#wget https://raw.githubusercontent.com/dominikh/go-errcheck.el/master/go-errcheck.el -O $EMACSDIR/conf/go-errcheck.el
#wget https://raw.githubusercontent.com/nsf/gocode/master/emacs/go-autocomplete.el -O $EMACSDIR/conf/go-autocomplete.el
#wget https://raw.githubusercontent.com/golang/tools/master/cmd/oracle/oracle.el -O $EMACSDIR/conf/oracle.el
wget https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py -O $EMACSDIR/bin/cpplint.py
chmod a+x $EMACSDIR/bin/cpplint.py

wget http://tamacom.com/global/global-6.5.tar.gz -O /tmp/global.tar.gz
mkdir /tmp/gtags
tar -x --strip-components=1 -C /tmp/gtags -f /tmp/global.tar.gz
pushd /tmp/gtags
./configure --prefix=$EMACSDIR/gtags
make install
popd
rm -rf /tmp/gtags /tmp/global.tar.gz

git clone --recurse-submodules https://github.com/nosami/OmniSharpServer.git /tmp/OmniSharpServer
pushd /tmp/OmniSharpServer
xbuild
mv  OmniSharp/bin/Debug $EMACSDIR/OmniSharp
popd
rm -rf /tmp/OmniSharpServer


mkdir -p $EMACSDIR/.gtags
pushd $EMACSDIR/.gtags
GTAGSLIBPATH=$EMACSDIR/.gtags $EMACSDIR/gtags/bin/gtags -c

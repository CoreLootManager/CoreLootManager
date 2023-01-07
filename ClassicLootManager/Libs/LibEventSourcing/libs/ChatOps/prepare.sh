#!/bin/sh

VERSION=$1
pipx install gitman
gitman install
sed -i "s/{VERSION}/$VERSION/g" *.toc
name=$(basename $(pwd))
echo "Directory name is $name"
cd ..
zip -r $name/release.zip $name --include \*.lua \*.xml \*.toc
cd $name
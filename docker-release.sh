#!/bin/sh
id=$(docker create aria2-mingw)
tag=$(git describe --tags --abbrev=0)
docker cp $id:/aria2/src/aria2c.exe ./aria2c.exe
docker rm -v $id

git log -n 10 > ./ChangeLog

zip -9 "aria2-${tag}-win64".zip NEWS AUTHORS README.mingw LICENSE.OpenSSL ChangeLog COPYING README.html aria2c.exe

echo "aria2-${tag}-win64.zip"


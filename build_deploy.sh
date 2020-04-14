#!/bin/bash
BASE_PATH=$(dirname "${BASH_SOURCE}")
BASE_PATH=$(cd "${BASE_PATH}"; pwd)

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <version>"
  echo "e.g.: $0 4.0.0-rc.0"
  exit 1
fi
VERSION=$1

# build all boxes
for i in base mozart metrics grq factotum cont_int; do
  cd $i
  vagrant plugin install vagrant-vbguest
  vagrant up
  vagrant package --base $i
  vagrant cloud auth login
  vagrant cloud publish -f -d "HySDS CentOS7 $i box." --version-description "Version $VERSION" -r -c $(md5 -q package.box) -C md5 hysds/$i $VERSION virtualbox package.box
  vagrant destroy -f
  cd ..
done

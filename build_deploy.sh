#!/bin/bash

# build all boxes
for i in base mozart metrics grq factotum cont_int; do
  cd $i
  vagrant plugin install vagrant-vbguest
  vagrant up
  vagrant package --base $i
  vagrant cloud auth login
  vagrant cloud publish -f -d "HySDS CentOS7 $i box." --version-description "Version 4.0.0" -r -c $(md5 -q package.box) -C md5 hysds/$i 4.0.0 virtualbox package.box
  vagrant destroy -f
  cd ..
done

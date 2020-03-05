# hysds-vagrant
Hybrid Cloud Science Data System deployment on VirtualBox via Vagrant:

https://app.vagrantup.com/hysds

## Requirements
- VirtualBox 6.1.4+
- Vagrant 2.2.7+

## Instantiate HySDS cluster
```
git clone https://github.com/hysds/hysds-vagrant.git
cd hysds-vagrant/cluster
vagrant up
```

## Halt/Shutdown HySDS cluster
```
vagrant halt
```

## Tear down HySDS cluster
```
vagrant destroy
```

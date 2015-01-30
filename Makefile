.PHONY: build build-vmware build-testing

build:
	packer build debian-7-wheezy-virtualbox.json

build-vmware:
	packer build --only vmware-iso debian-7-wheezy.json

build-testing:
	packer build debian-8-testing-virtualbox.json

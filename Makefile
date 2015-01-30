.PHONY: build build-vmware build-testing

build:
	packer build debian-7-wheezy-virtualbox.json

build-vmware:
	packer build --only debian-7-wheezy.json

build-testing:
	packer build --only virtualbox debian-8-testing.json


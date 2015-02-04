.PHONY: build build-vmware build-testing clean

clean-all: clean-virtualbox clean-vmware

clean-virtualbox:
	@rm -rf output-virtualbox-iso

clean-vmware:
	@rm -rf output-vmware-iso

build: clean-virtualbox
	packer build debian-7-wheezy-virtualbox.json

build-vmware: clean-vmware
	packer build --only vmware-iso debian-7-wheezy.json

build-testing: clean-virtualbox
	packer build --only virtualbox-iso debian-8-jessie.json

build-testing-vmware: clean-virtualbox
	packer build --only vmware-iso debian-8-jessie.json

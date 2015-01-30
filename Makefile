.PHONY: build build-vmware build-testing

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
	packer build debian-8-jessie.json

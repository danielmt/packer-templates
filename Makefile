.PHONY: build build-vmware build-testing clean

clean-all: clean-virtualbox clean-vmware

clean-virtualbox:
	@rm -rf output-virtualbox-iso

clean-vmware:
	@rm -rf output-vmware-iso

build-all: clean-virtualbox clean-vmware
	packer build debian-8.1.0-64-puppet.json

build-vmware: clean-vmware
	packer build --only vmware-iso debian-8.1.0-64-puppet.json

build-virtualbox: clean-virtualbox
	packer build --only virtualbox-iso debian-8.1.0-64-puppet.json

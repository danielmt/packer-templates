# Debian Packer Templates

The current and only template was created for Debian 7.8.0 VM boxes.
These boxes are "vanilla" with a minimal setup, 256MB RAM, 1 CPU and includes Puppet.

These settings can be easily changed in vagrant.

## Prerequisites

* Packer (>= 0.5.0)(http://www.packer.io/downloads.html)
* Vagrant (>= 1.2.4)(http://downloads.vagrantup.com/)
* VirtualBox or VMWare

### Installing Packer via Homebrew

```bash
$ brew tap homebrew/binary
$ brew install packer
```

## Configure the vagrant box

Edit the debian-7-wheezy-virtualbox.json and check the variables at the beginning of the file.

*Note*:

The debian iso file name contains the version number and, as soon as a new release will be out and the 780 will be removed from the debian servers, the debian-780-wheezy-virtualbox.json file will be outdated and you'll get the "ISO download failed" error after running the build command.
To fix the issue go on http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/, check which is the latest net-inst version and copy its checksum from the MD5SUMS file. Then edit the .json file and update these variables at the beginning of the .json file:
* "iso_url": update the link to the iso file
* "iso_md5": insert the new MD5 checksum
* "vm_name": update the version

## Build vagrant box

```bash
$ packer build debian-7-wheezy-virtualbox.json
```

or optionnaly, select only one provider, for example ```vmware```:

```bash
$ packer build -only vmware debian-7-wheezy.json
```
*NOTE* Unfortunately Packer has a bug and will not recognize the -only option until [this bug](https://github.com/mitchellh/packer/pull/1402) will be open.

### Install your new box

```bash
$ vagrant box add debian-7-wheezy ./debian-780-wheezy-vbox.box
```

or

```bash
$ vagrant box add debian-7-wheezy ./debian-780-wheezy.box
```

The VM image has been imported to vagrant, it's now available on your system.

## Vagrant

### Getting Started

To use this image with Vagrant, create a vagrant file (```vagrant init```), and use the newly created box:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "debian-780-wheezy"

  # Make ssh login secure
  # config.ssh.private_key_path = '~/.ssh/id_rsa'
  #
  # [...]
end
```

And initialize the vm:

```bash
$ vagrant up --provider=vmware_fusion
```

The ```--provider``` option is only needed if another vagrant provider is available, like virtualbox.

### Ignore vagrant boxes in git

```bash
$ echo ".vagrant" >> ~/.gitignore
```

## Contributing

1. Fork it
2. Create your recipe branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some features'`)
4. Push to the branch (`git push origin my-new-features`)
5. Create new Pull Request

## Credits

  This project is based on [Tech Angels Packer templates](https://github.com/tech-angels/packer-templates/)

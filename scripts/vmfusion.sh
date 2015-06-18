cd /tmp
mkdir -p /mnt/cdrom /mnt/hgfs

# compatible with jessie
# apt-get -y install open-vm-tools open-vm-tools-dkms

# not compatible with jessie - tested with vmware fusion 7.1.2
#mount -o loop /home/vagrant/linux.iso /mnt/cdrom
#tar zxvf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
#/tmp/vmware-tools-distrib/vmware-install.pl -d
#rm /home/vagrant/linux.iso
#umount /mnt/cdrom

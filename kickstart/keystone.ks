#version=DEVEL
#ignoredisk --only-use=sdd,sde,sdf,sdg,sdh,sdi
# System bootloader configuration
bootloader --location=mbr --boot-drive=sda
autopart --type=lvm
# Partition clearing information
clearpart --all --initlabel --drives=sdd
# Use graphical install
graphical
# Use CDROM installation media
cdrom
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=static --device=eno1 --gateway=192.168.1.1 --ip=192.168.2.1 --nameserver=192.168.3.4,1.1.1.1 --netmask=255.255.252.0 --ipv6=auto --activate
network  --hostname=keystone.localdomain
# Root password
rootpw --iscrypted $6$ILt3/5Brq76qxyri$2W0iMQE/1TYchWcaYCdDBApKJZs5bznRrJFjFk1B/Wwez/pAPlQic531On5nTUjuqNJDcXqG9pGnbvVXWMpE6/
# Run the Setup Agent on first boot
firstboot --enable
# Do not configure the X Window System
skipx
# System services
services --enabled="chronyd"
# System timezone
timezone America/New_York --isUtc
user --groups=wheel --name=steve --password=$6$5oCSNpgN554Em6um$WNb0l5sqJgSKGueUPpFl3PoBGpibwukhGquwjbKgpeerx68xdYQqv.CrhvIri93VRTVOiMX4QrhwBQLESEuo7. --iscrypted --gecos="steve"

%packages
@^server-product-environment
@ansible-node
@editors

%end

%addon com_redhat_kdump --disable --reserve-mb='128'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end

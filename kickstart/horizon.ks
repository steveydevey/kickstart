#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
cdrom
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=vda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=eth0 --ipv6=auto --activate
network  --hostname=horizon.localdomain

# Root password
rootpw --iscrypted $6$WupGjPRW7avwqAWS$2Lij9dJ9C9.KvMfrOTDhUDzF9F3OSSc3muUJEM0z6ow37wywN2cphOXGxvDIDTsJzDqUxpV23NS/YiXO3Qylj1
# System services
services --enabled="chronyd"
# System timezone
timezone America/New_York --isUtc
user --groups=wheel --name=steve --password=$6$aQ89nwHqe7WJx72r$A3j/ktBhgSwcEc2RIoRdoddNSFEOTQPVtexGoHfsucOA/uU/zaiW2dOlzw63H38jK4XVr7WF2KlZSipo88Krd1 --iscrypted --gecos="steve"
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=vda
autopart --type=lvm
# Partition clearing information
clearpart --none --initlabel

%packages
@^minimal
@core
chrony
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end


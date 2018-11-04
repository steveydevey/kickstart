# kickstart

virt-install notes

basic install with VNC:

```
virt-install \
--name keystone \
--ram 1024 \
--disk path=/vms/keystone.qcow2,size=18 \
--vcpus 1 \
--os-type linux \
--os-variant centos7.0 \
--network bridge=brmgmt \
--graphics vnc,listen=0.0.0.0 --noautoconsole \
--console pty,target_type=serial \
--cdrom /iso/CentOS-7-x86_64-Minimal-1804.iso
```

kickstart attempt stuff:
```
--extra-args "ks=file:/root/kvm/kickstart/keystone.ks"
```

```
--location 'http://mirror.i3d.net/pub/centos/7/os/x86_64/' \
```

```
--location '/mnt/linux/CentOS-7-x86_64-Minimal-1804.iso' \
--initrd-inject=/root/kvm/kickstart/keystone.ks \
--extra-args 'console=ttyS0,115200n8 serial ks=file:/root/kvm/kickstart/keystone.ks'
```


*note: initrd inject points to host file system*

Working:

```
virt-install \  
--name nova \
--ram 1024 \
--disk path=/vms/nova.qcow2,size=18 \
--vcpus 1 \
--os-type linux \
--os-variant centos7.0 \
--network bridge=brmgmt \
--graphics vnc,listen=0.0.0.0 --noautoconsole \
--console pty,target_type=serial \
--location /iso/CentOS-7-x86_64-Minimal-1804.iso \
--initrd-inject=/nova.ks \
--extra-args 'console=ttyS0,115200n8 serial ks=file:/nova.ks edd=off nomodeset'
```

# BeegfsBuilding

The repo is used for beegfs installation and deployment in VMware workstation and AWS EC2, and we performed fault injection-based taxonomy. Detailed results can be found in our paper:

- "[Fingerprinting the checker policies of parallel file systems](https://ieeexplore.ieee.org/abstract/document/9307050)",Runzhou Han, Duo Zhang, Mai Zheng,IEEE/ACM Fifth International Parallel Data Systems Workshop (PDSW), 2020

# Installation Details

The repo contains all installation package of ubuntu16.04 wihh kernel 4.15.0-91-generic

Management Service   your ip:130.127.133.212 
#remember replace to your management ip
/opt/beegfs/sbin/beegfs-setup-mgmtd -p /data/beegfs/beegfs_mgmtd

Metadata Service cp1 cp2
mkfs.ext4 /dev/sda4
mkdir /mnt/mt1 -p
mount /dev/sda4 /mnt/mt1
/opt/beegfs/sbin/beegfs-setup-meta -p /mnt/mt1/beegfs/beegfs_meta -s 1 -m 130.127.133.212
#/opt/beegfs/sbin/beegfs-setup-meta -p /data/beegfs/beegfs_meta -s 1 -m 130.127.133.212
#echo node1 > /data/beegfs/beegfs_meta/nodeID

mkfs.ext4 /dev/sda4
mkdir /mnt/mt2 -p
mount /dev/sda4 /mnt/mt2
/opt/beegfs/sbin/beegfs-setup-meta -p /mnt/mt2/beegfs/beegfs_meta -s 2 -m 130.127.133.212
#/opt/beegfs/sbin/beegfs-setup-meta -p /data/beegfs/beegfs_meta -s 2 -m 130.127.133.212
#echo node2 > /data/beegfs/beegfs_meta/nodeID

Storage Service cp3 cp4 cp5
mkfs.ext4 /dev/sda4
mkdir /mnt/md3 -p
mount /dev/sda4 /mnt/md3
/opt/beegfs/sbin/beegfs-setup-storage -p /mnt/md3/beegfs_storage -s 3 -i 301 -m 130.127.133.212
#echo host196 > /mnt/md1/beegfs_storage/nodeID

mkfs.ext4 /dev/sda4
mkdir /mnt/md4 -p
mount /dev/sda4 /mnt/md4
/opt/beegfs/sbin/beegfs-setup-storage -p /mnt/md4/beegfs_storage -s 4 -i 401 -m 130.127.133.212
#echo host196 > /mnt/md1/beegfs_storage/nodeID

mkfs.ext4 /dev/sda4
mkdir /mnt/md5 -p
mount /dev/sda4 /mnt/md5
/opt/beegfs/sbin/beegfs-setup-storage -p /mnt/md5/beegfs_storage -s 5 -i 501 -m 130.127.133.212
#echo host196 > /mnt/md1/beegfs_storage/nodeID

To add a second storage target on this same machine:
$ /opt/beegfs/sbin/beegfs-setup-storage -p /mnt/myraid2/beegfs_storage -s 3 -i 302

Client cp6 cp7
/opt/beegfs/sbin/beegfs-setup-client -m 130.127.133.212
/opt/beegfs/sbin/beegfs-setup-client -m 130.127.133.212


systemctl start beegfs-mgmtd
systemctl start beegfs-meta
systemctl start beegfs-storage
systemctl start beegfs-helperd
systemctl start beegfs-client

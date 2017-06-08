An offline Arch Linux installer.

Some configurations that depend on an active internet connection can only be done successfully if network is available.

This kind of offline install is only useful when you are installing from a custom live cd/dvd where you have a pre-configured system with everything else that you need. This project emerged from that kind of requirement where I create my archlinux live cd with [JLIVECD](https://github.com/neurobin/JLIVECD) and install it with **jinarch**.

# USE/INSTALL

**jinarch** can be run without installing, from the directory that it resides:

```bash
./jinarch # as root
```
Or it can be installed:

```bash
./install.sh # as root
```
then run as:

```bash
jinarch
```

Arch Linux installation can be automated (you will still be prompted for passwords for accounts) using a configuration file **jinarch.conf**. If you installed the script, it should be available as */etc/jinarch.conf*. Or if you are running from a directory as `./jinarch`, you will have to rename the *./jinarch.conf.in* file to *./jinarch.conf* and make necessary changes there.

**jinarch** searches for the configuration file as follows:

1. Firstly, in */etc/jinarch.conf*
2. secondly, in *./jinarch.conf* (in the current working directory)

# STEPS

**jinarch** tries to automate an offline installation except the partitioning step. You will have to partition the disks manually. **jinarch** will only let you select the partitions for different mount points (/, /home, /boot, /var etc..) and then mount it. It does not create/delete/change/format any partitions in any way.

The installation involves the following steps:

1. Checking network connection
2. Updating the system clock
3. Mounting partitions
4. Selecting mirrors
5. Installing the system
6. Generating /etc/fstab
7. Installing grub bootloader
8. chroot into the new system
9. Setting time zone
10. Setting locale
11. Keymap settings
12. Typematic delay and rate settings
13. Setting hostname
14. Checking network status in chroot
15. Setting the root password
16. Updating grub configuration
17. Setting the default login shell
18. Creating a standard user account with sudo access
19. Leave the chroot open for further modification

After the last step, the `chroot` is left open. You can modify your new system as you wish. After it's done, run `exit` to exit the chroot and clean the system. After exiting chroot, you will land on the original terminal prompt again.

**You can reboot now**

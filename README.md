Linux BSP for OnRISC devices
============================

Toolchain Installation
----------------------
First of all you'll need a cross-compiler, that can be downloaded from here:
https://launchpad.net/linaro-toolchain-binaries/trunk/2013.10/+download/gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_linux.tar.xz
Install/extract it to `/opt/`

Get Source Code
---------------
Create a folder in your user directory, for example `~/projects`. Then execute following steps:

1. `cd ~/projects`
2. `git clone https://github.com/visionsystemsgmbh/am335x-onrisc.git`
3. `cd am335x-onrisc`
4. `git checkout linux-3.2-psp`
5. install StGit utility (http://www.procode.org/stgit/)
6. `./patch.sh`

**patch.sh** will clone the original TI kernel repository and apply Alekto 2 specific patches, hence it
will take a while till the process is finished. The duration depends on your network connection.

Compilation
-----------
The first three steps must be always done, when you enter `kernel` folder, as these environment variables are valid only for the current session.

1. `export ARCH=arm`
2. `export PATH=/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_linux/bin/:$PATH`
3. `export CROSS_COMPILE=arm-linux-gnueabihf-`
4. `make menuconfig` (this is an optional step. Execute it, if you need to change your kernel configuration)
5. `make uImage` (`uImage` is created in `arch/arm/boot`)
6. `make tar-pkg` (this creates `linux-3.2.0+.tar` in kernel root directory. This archive provides kernel modules, that you'll need to install on your target system via `tar xf linux-3.2.0+.tar -C /`)

Linux BSP for OnRISC devices
============================

Get Source Code
---------------

1. `git clone https://github.com/visionsystemsgmbh/am335x-onrisc.git`
2. `cd am335x-onrisc`
3. `git checkout linux-3.2-psp`
4. install StGit utility (http://www.procode.org/stgit/)
5. `./patch.sh`

**patch.sh** will clone the original TI kernel repository and apply Alekto 2 specific patches, hence it
will take a while till the process is finished. The duration depends on your network connection.

Compilation
-----------

You'll need a cross-compiler, that can be downloaded from here:
https://launchpad.net/linaro-toolchain-binaries/trunk/2013.10/+download/gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_linux.tar.xz
Install it to `/opt/` and execute following commands:

1. `export ARCH=arm`
2. `export PATH=/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_linux/bin/:$PATH`
3. `export CROSS_COMPILE=arm-linux-gnueabihf-`
4. `make menuconfig` (this is an optional step. Execute is, if you need to change your kernel configuration)
5. `make uImage` (`uImage` is created in `arch/arm/boot`)
6. `make tar-pkg` (this step creates linux-3.2.0+.tar in kernel root directory. This archive provides kernel modules, that you'll need to install on your target system via `tar xf linux-3.2.0+.tar -C /`)

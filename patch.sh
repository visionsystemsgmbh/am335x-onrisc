#!/bin/sh

DIR="$PWD"

COMMIT=0e6a805aac5bb916350190b0e853e620c315edd5

# check for stgit binary
which stg
rc=$?

if [[ $rc != 0 ]] ; then
        echo stg not found. Please install Stacked Git utility
        exit
fi

# fetch and patch kernel
if [ ! -d ${DIR}/kernel ] ; then
	mkdir -p ${DIR}/kernel
fi

cd ${DIR}/kernel

if [ ! -f ./.git/config ] ; then
	git clone http://arago-project.org/git/projects/linux-am33x.git .
	git checkout $COMMIT
	git checkout -b onrisc
	stg init
	stg import -s $DIR/patches/series
else
	git fetch
fi

if [ ! -f ./.config ] ; then
	cp $DIR/configs/.config .
fi

# fetch pm firmware
if [ ! -d ${DIR}/firmware ] ; then
	mkdir -p ${DIR}/firmware
fi

cd ${DIR}/firmware

if [ ! -f ./.git/config ] ; then
	git clone http://arago-project.org/git/projects/am33x-cm3.git .
	cp bin/am335x-pm-firmware.bin ${DIR}/kernel/firmware
else
	git fetch
fi

#!/bin/sh

DIR="$PWD"

EXTERNAL_BRANCH=v3.2-staging

# fetch and patch kernel
if [ ! -d ${DIR}/kernel ] ; then
	mkdir -p ${DIR}/kernel
fi

cd ${DIR}/kernel

if [ ! -f ./.git/config ] ; then
	git clone http://arago-project.org/git/projects/linux-am33x.git .
	git checkout $EXTERNAL_BRANCH
	stg init
	stg import -s $DIR/patches/series
	stg push -a
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

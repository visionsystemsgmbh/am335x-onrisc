#!/bin/sh

DIR="$PWD"

EXTERNAL_BRANCH=v3.2-staging

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



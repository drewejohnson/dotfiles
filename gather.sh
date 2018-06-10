#! /usr/bin/env bash
# Move all config and dot files into the repository

cp -v ~/.vimrc .
cp -v ~/.bashrc .
cp -v ~/.bash_aliases .

CONF=${HOME}/.config
cp -v $CONF/neofetch/config.conf neofetch/
cp -v ${CONF}/i3/config i3/
cp -v ${CONF}/i3/i3exit.sh i3/
cp -v ${CONF}/polybar/config polybar/
cp -v ${CONF}/polybar/launch.sh polybar
cp -v ${CONF}/rofi/config.rasi rofi/
cp -v ${CONF}/rofi/rofi-dark.rasi rofi/
cp -v ~/.ipython/profile_default/ipython_config.py ipython/profile_default

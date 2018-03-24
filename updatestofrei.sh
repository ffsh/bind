#!/bin/bash
# Simple script to update the dns (db.net.freifunk.stormarn) files from git

# CONFIGURE THIS TO YOUR GIT DIRECTORY
GIT_REPO=/home/dnsbind/bind

# CONFIGURE THIS TO THE USER TO RUN THE GIT COMMANDS AS
USER=dnsbind

cd $GIT_REPO

su -c "git pull -q" $USER

if ! cmp $GIT_REPO/db.net.freifunk.stormarn /etc/bind/db.net.freifunk.stormarn >/dev/null 2>&1 ;
then
    cp $GIT_REPO/db.net.freifunk.stormarn /etc/bind/db.net.freifunk.stormarn

    /usr/sbin/service bind9 status 2>&1> /dev/null
    if [[ $? -eq 0 ]]
    then
        /usr/sbin/service bind9 restart
    fi
fi

if ! cmp $GIT_REPO/db.de.freifunk-stormarn /etc/bind/db.de.freifunk-stormarn >/dev/null 2>&1 ;
then
    cp $GIT_REPO/db.de.freifunk-stormarn /etc/bind/db.de.freifunk-stormarn

    /usr/sbin/service bind9 status 2>&1> /dev/null
    if [[ $? -eq 0 ]]
    then
        /usr/sbin/service bind9 restart
    fi
fi

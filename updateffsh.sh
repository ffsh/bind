#!/bin/bash
# Simple script to update the dns (Freifunk Suedholstein) files from git

# CONFIGURE THIS TO YOUR GIT DIRECTORY
GIT_REPO=/home/dnsbind/bind

# CONFIGURE THIS TO THE USER TO RUN THE GIT COMMANDS AS
USER=dnsbind

cd $GIT_REPO

su -c "git pull -q" $USER

if ! cmp $GIT_REPO/db.de.freifunk-suedholstein /etc/bind/db.de.freifunk-suedholstein >/dev/null 2>&1 ;
then
    cp $GIT_REPO/db.de.freifunk-suedholstein /etc/bind/db.de.freifunk-suedholstein

    /usr/sbin/service bind9 status 2>&1> /dev/null
    if [[ $? -eq 0 ]]
    then
        /usr/sbin/service bind9 restart
    fi
fi


if ! cmp $GIT_REPO/db.de.ffshev /etc/bind/db.de.ffshev >/dev/null 2>&1 ;
then
    cp $GIT_REPO/db.de.ffshev /etc/bind/db.de.ffshev

    /usr/sbin/service bind9 status 2>&1> /dev/null
    if [[ $? -eq 0 ]]
    then
        /usr/sbin/service bind9 restart
    fi
fi

#if ! cmp $GIT_REPO/db.net.freifunk.suedholstein /etc/bind/db.net.freifunk.suedholstein >/dev/null 2>&1 ;
#then
#    cp $GIT_REPO/db.net.freifunk.suedholstein /etc/bind/db.net.freifunk.suedholstein
#
#    /usr/sbin/service bind9 status 2>&1> /dev/null
#    if [[ $? -eq 0 ]]
#    then
#        /usr/sbin/service bind9 restart
#    fi
#fi

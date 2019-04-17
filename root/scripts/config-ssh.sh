#!/bin/bash

if [ ! -f $HOME/.bashrc ]; then
    touch> $HOME/.bashrc
fi

if [ ! -d "/var/run/sshd" ]; then
    mkdir /var/run/sshd
fi

if [ ${SSH_PASSWORD} ]; then
    echo ""
    echo " ========================================= "
    echo "Configuring SSH service"

    echo "root:${SSH_PASSWORD}" | chpasswd
    sed -i 's/#\?PermitRootLogin prohibit-password.*/PermitRootLogin yes/' /etc/ssh/sshd_config

    echo "Done!"
    echo " ========================================= "
    else
        echo ""
        echo " ========================================= "
        echo "SSH was configured previously"
        echo " ========================================= "
    fi
else
    echo ""
    echo " ========================================= "
    echo "Password for root not provided. Please provide it using the env SSH_PASSWORD"
    echo " ========================================= "
fi

if [ -d "/var/run/sshd" ]; then
    echo ""
    echo " ========================================= "
    echo "SSH was configured previously"
    echo " ========================================= "
fi

# SSH login fix. Otherwise user is kicked off after login
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

grep 'export VISIBLE=now' /etc/profile || echo 'export VISIBLE=now' >> /etc/profile

export NOTVISIBLE="in users profile"
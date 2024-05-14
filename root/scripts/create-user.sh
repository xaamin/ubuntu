#!/bin/bash

USER=${USER:-'rocket'}

USER_UID=${USER_UID:-8276}
USER_GID=${USER_GID:-8276}

echo "Validating ${USER}"

if [[ ! -d "/home/$USER" ]]; then
    useradd -m $USER

    usermod -s /bin/false $USER

    cp /root/.bashrc /home/${USER}/.bashrc

    echo "Creating user $USER with uid $USER_UID guid $USER_GID"

    usermod -o -u $USER_UID $USER
    groupmod -o -g $USER_GID $USER

    echo '
    -------------------------------------
    GID/UID
    -------------------------------------'
    echo "
    User uid:    $(id -u $USER)
    User gid:    $(id -g $USER)
    -------------------------------------
    "

    chown -R $USER:$USER "/home/$USER"
else
    echo '
    -------------------------------------
    GID/UID
    -------------------------------------'
    echo "
    User uid:    $(id -u $USER)
    User gid:    $(id -g $USER)
    -------------------------------------
    "
fi

ls -la /home
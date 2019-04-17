#!/bin/bash

USER=${USER:-xaamin}

USER_ID=${USER_ID:-8276}
USER_GID=${USER_GID:-8276}

echo "Validating ${USER}"

APPLY_PERMISSIONS=false

if [[ ! -d "/home/$USER" ]]; then
    APPLY_PERMISSIONS=true
fi

if [[ ! -d "/home/$USER" ]]; then
    echo "Creating user $USER with uid $USER_ID guid $USER_GID"

    useradd -m $USER

    usermod -s /bin/false $USER

    cp /root/.bashrc /home/${USER}/.bashrc
fi

/bin/bash /root/scripts/fix-uid-and-gid.sh

if $APPLY_PERMISSIONS ; then
    echo "Applying permissions to home"

    chown -R $USER:$USER "/home/$USER"

    chmod g+rwxs "/home/$USER"
fi

echo '
    -------------------------------------
    Finished with GID/UID
    -------------------------------------'
echo "
    User uid:    $(id -u $USER)
    User gid:    $(id -g $USER)
    -------------------------------------
    "

ls -la /home

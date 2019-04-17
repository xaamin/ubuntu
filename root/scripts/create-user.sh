#!/bin/bash

USER=${USER:-xaamin}

USER_ID=${USER_ID:-8276}
USER_GID=${USER_GID:-8276}

echo "Validating ${USER}"

# Create user if not exists

if [[ ! -d "/home/$USER" ]]; then
    echo "Creating user $USER with uid $USER_ID guid $USER_GID"

    useradd -m $USER
fi

# Add bash completion

if [ ! -f /home/${USER}/.bashrc ]; then
    cp /root/.bashrc /home/${USER}/.bashrc
fi

/bin/bash /root/scripts/fix-uid-and-gid.sh

LOCK_FILE="/home/$USER/owner-permissions.lock"

if [ ! -f "$LOCK_FILE" ]; then
    echo "Applying permissions to home"

    chown -R $USER:$USER /home/$USER

    touch $LOCK_FILE

    chmod g+rwxs /home/$USER

    chmod g+rwxs -R /home/$USER/web || true
fi

if [ ! -d "/home/$USER/.ssh" ]; then
    mkdir "/home/$USER/.ssh"
fi

$SSH_PATH="/home/$USER/ssh"

if [ -d "$SSH_PATH" ]; then
    cp -f $SSH_PATH/* /home/$USER/.ssh/
fi

chown -R $USER:$USER "/home/$USER/.ssh" || true

chmod 0400 "/home/$USER/.ssh/id_rsa*" || true

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

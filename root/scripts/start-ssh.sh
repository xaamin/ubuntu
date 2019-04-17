#!/bin/bash

# Create the default user
/bin/bash /root/scripts/create-user.sh

# Configure SSH service
/bin/bash /root/scripts/config-ssh.sh

# Start the SSH service foreground
/usr/sbin/sshd -D
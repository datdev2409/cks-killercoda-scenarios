#!/bin/bash

# Clear screen and show spinner message
clear
echo "Preparing the insecure Kubelet environment for you to harden..."

CONFIG="/var/lib/kubelet/config.yaml"

# Wait until the kubeadm config is ready
while [ ! -f $CONFIG ]; do sleep 1; done

# 1. Enable anonymous authentication
# The block looks like:
# authentication:
#   anonymous:
#     enabled: false
sed -i '/anonymous:/{n;s/enabled: false/enabled: true/;}' $CONFIG

# 2. Disable Kubelet authorization by removing the authorization block completely
# This forces the Kubelet to default to AlwaysAllow for authorization
sed -i '/^authorization:/,/mode: Webhook/d' $CONFIG

# 3. Enable read-only port 10255
# If readOnlyPort exists, replace it, else append it.
if grep -q "readOnlyPort" $CONFIG; then
    sed -i 's/readOnlyPort:.*/readOnlyPort: 10255/' $CONFIG
else
    echo "readOnlyPort: 10255" >> $CONFIG
fi

# Restart kubelet to apply insecure changes
systemctl restart kubelet

# Wait for kubelet port to be listening just to be safe
sleep 3

echo "Environment is ready! You can now follow the instructions."

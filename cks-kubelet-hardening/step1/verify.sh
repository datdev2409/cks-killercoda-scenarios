#!/bin/bash

# Ensure Kubelet config file exists
CONFIG_FILE="/var/lib/kubelet/config.yaml"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Config file not found"
    exit 1
fi

# Verify readOnlyPort is set to 0
# Handles optional spacing like readOnlyPort: 0 or readOnlyPort:0
grep -q -E "readOnlyPort:\s*0" "$CONFIG_FILE"
if [ $? -ne 0 ]; then
    echo "readOnlyPort is not set to 0"
    exit 1
fi

# Verify anonymous authentication is disabled
# Using grep -A to look for enabled: false under anonymous block
grep -A 2 -i "anonymous:" "$CONFIG_FILE" | grep -q -i "enabled: false"
if [ $? -ne 0 ]; then
    echo "Anonymous authentication is not disabled"
    exit 1
fi

# Finally check if kubelet is running and healthy
systemctl is-active kubelet -q
if [ $? -ne 0 ]; then
    echo "Kubelet service is not active"
    exit 1
fi

exit 0

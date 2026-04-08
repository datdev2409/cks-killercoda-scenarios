#!/bin/bash

# Verify there are at least two keys in the enc file
CONFIG_FILE=$(grep -oP '(?<=\-\-encryption-provider-config=).*' /etc/kubernetes/manifests/kube-apiserver.yaml | tr -d '"' | tr -d "'")

if [ -f "$CONFIG_FILE" ]; then
    # Count the number of "name:" lines under keys block.
    # We will just verify if there are two keys.
    KEY_COUNT=$(grep 'name:' "$CONFIG_FILE" | wc -l)
    
    if [ "$KEY_COUNT" -ge 2 ]; then
        exit 0
    fi
fi
exit 1

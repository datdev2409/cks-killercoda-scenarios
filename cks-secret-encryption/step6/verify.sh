#!/bin/bash

CONFIG_FILE=$(grep -oP '(?<=\-\-encryption-provider-config=).*' /etc/kubernetes/manifests/kube-apiserver.yaml | tr -d '"' | tr -d "'")

if [ -f "$CONFIG_FILE" ]; then
    grep -q 'configmaps' "$CONFIG_FILE"
    if [ $? -eq 0 ]; then
        exit 0
    fi
fi
exit 1

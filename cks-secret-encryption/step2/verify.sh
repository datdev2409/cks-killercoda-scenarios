#!/bin/bash

# Check if the generated proof file contains the aescbc encryption header
if [ -f /root/etcd-proof.txt ]; then
    cat /root/etcd-proof.txt | grep -q 'k8s:enc:aescbc:v1:'
    if [ $? -eq 0 ]; then
        exit 0
    fi
fi
exit 1

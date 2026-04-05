#!/bin/bash
if [ -f /usr/local/bin/kubeadm ]; then
    exit 0
else
    exit 1
fi

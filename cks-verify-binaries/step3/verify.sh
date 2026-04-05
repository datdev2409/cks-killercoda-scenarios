#!/bin/bash
if [ -f /usr/local/bin/kubelet ]; then
    exit 0
else
    exit 1
fi

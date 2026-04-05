#!/bin/bash
if [ ! -f ~/.kubernetes-binaries/kubelet ]; then
    exit 0
else
    exit 1
fi

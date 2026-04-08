#!/bin/bash

# Check apiserver manifest for the flag
grep -q "\-\-encryption-provider-config=" /etc/kubernetes/manifests/kube-apiserver.yaml
HAS_FLAG=$?

# Verify the file config
CONFIG_FILE=$(grep -oP '(?<=\-\-encryption-provider-config=).*' /etc/kubernetes/manifests/kube-apiserver.yaml | tr -d '"' | tr -d "'")

HAS_AES=1
if [ -f "$CONFIG_FILE" ]; then
    grep -q 'aescbc:' "$CONFIG_FILE"
    HAS_AES=$?
fi

# Ensure kube-apiserver is actually running
kubectl get pods -n kube-system -l component=kube-apiserver | grep -q 'Running'
IS_RUNNING=$?

# Ensure volume mount
grep -q 'mountPath: /etc/kubernetes/enc' /etc/kubernetes/manifests/kube-apiserver.yaml
HAS_MOUNT=$?

if [ $HAS_FLAG -eq 0 ] && [ $HAS_AES -eq 0 ] && [ $HAS_MOUNT -eq 0 ] && [ $IS_RUNNING -eq 0 ]; then
  exit 0
else
  exit 1
fi

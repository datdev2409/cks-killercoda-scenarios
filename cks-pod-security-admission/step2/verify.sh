#!/bin/bash

# Check apiserver manifest for the flag
grep -q "\-\-admission-control-config-file=" /etc/kubernetes/manifests/kube-apiserver.yaml
HAS_FLAG=$?

# Extract the file path from the flag
CONFIG_FILE=$(grep -oP '(?<=\-\-admission-control-config-file=).*' /etc/kubernetes/manifests/kube-apiserver.yaml | tr -d '"' | tr -d "'")

# Verify the file config
HAS_RESTRICTED=1
HAS_EXEMPTION=1
if [ -f "$CONFIG_FILE" ]; then
    grep -q 'enforce:.*restricted' "$CONFIG_FILE"
    HAS_RESTRICTED=$?
    
    grep -A2 'exemptions:' "$CONFIG_FILE" | grep -q 'kube-system'
    HAS_EXEMPTION=$?
fi

# Ensure kube-apiserver is actually running
kubectl get pods -n kube-system -l component=kube-apiserver | grep -q 'Running'
IS_RUNNING=$?

if [ $HAS_FLAG -eq 0 ] && [ $HAS_RESTRICTED -eq 0 ] && [ $HAS_EXEMPTION -eq 0 ] && [ $IS_RUNNING -eq 0 ]; then
  exit 0
else
  exit 1
fi

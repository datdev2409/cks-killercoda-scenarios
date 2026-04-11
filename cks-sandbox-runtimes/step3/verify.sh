#!/bin/bash

# Check if the cluster has at least one node with the label kata-enabled=true
HAS_LABEL=$(kubectl get nodes -l kata-enabled=true -o custom-columns=NAME:.metadata.name --no-headers 2>/dev/null)

if [ ! -z "$HAS_LABEL" ]; then
  # Verify the pod status is no longer Pending (it might be ContainerCreating or error)
  POD_STATUS=$(kubectl get pod stuck-pod -o jsonpath='{.status.phase}' 2>/dev/null)
  if [ "$POD_STATUS" != "Pending" ]; then
    exit 0
  fi
fi

exit 1

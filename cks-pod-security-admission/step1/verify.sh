#!/bin/bash

# Check if enforce=baseline
ENFORCE=$(kubectl get ns dev-team -o jsonpath='{.metadata.labels.pod-security\.kubernetes\.io/enforce}')
# Check if warn=restricted
WARN=$(kubectl get ns dev-team -o jsonpath='{.metadata.labels.pod-security\.kubernetes\.io/warn}')

if [ "$ENFORCE" == "baseline" ] && [ "$WARN" == "restricted" ]; then
  exit 0
else
  exit 1
fi

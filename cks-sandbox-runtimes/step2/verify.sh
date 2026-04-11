#!/bin/bash

# Check if the internal-processor pod uses the gvisor runtime class
RUNTIME=$(kubectl get pod internal-processor -o jsonpath='{.spec.runtimeClassName}' 2>/dev/null)

if [ "$RUNTIME" == "gvisor" ]; then
  exit 0
else
  exit 1
fi

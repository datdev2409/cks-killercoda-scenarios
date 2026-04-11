#!/bin/bash

# Check if the RuntimeClass untrusted exists and uses runsc handler
HANDLER=$(kubectl get runtimeclass untrusted -o jsonpath='{.handler}' 2>/dev/null)

if [ "$HANDLER" == "runsc" ]; then
  exit 0
else
  exit 1
fi

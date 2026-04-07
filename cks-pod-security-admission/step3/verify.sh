#!/bin/bash

# Check if pod exists and is either Running or ContainerCreating
STATUS=$(kubectl get pod nginx -n secure-ns -o jsonpath='{.status.phase}')

if [ "$STATUS" == "Running" ] || [ "$STATUS" == "Pending" ]; then
  exit 0
else
  exit 1
fi

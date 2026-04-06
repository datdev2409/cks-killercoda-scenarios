#!/bin/bash
echo "Waiting for Kubernetes cluster to be ready..."
while ! kubectl get nodes | grep -w "Ready" > /dev/null 2>&1; do
  sleep 2
done

echo "Setting up host executables and profile templates..."
while [ ! -f /opt/.backgroundfinished ]; do
  sleep 2
  echo -n "."
done
echo " Done!"
echo "The environment is ready. Please proceed to the first step."

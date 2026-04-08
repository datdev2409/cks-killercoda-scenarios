#!/bin/bash

# Create some dummy pre-existing secrets in the default namespace
kubectl create secret generic db-credentials --from-literal=password=supersecret
kubectl create secret generic api-token --from-literal=token=hiddentoken123

echo "done" >> /opt/.backgroundfinished

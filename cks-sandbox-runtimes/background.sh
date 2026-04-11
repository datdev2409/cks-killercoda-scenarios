#!/bin/bash

# Create gvisor RuntimeClass for step 2
cat <<EOF | kubectl apply -f -
apiVersion: node.k8s.io/v1
kind: RuntimeClass
metadata:
  name: gvisor
handler: runsc
EOF

# Create an untrusted running pod for step 2
kubectl run internal-processor --image=nginx:1.21

# Create a kata RuntimeClass with a strict nodeSelector for step 3
cat <<EOF | kubectl apply -f -
apiVersion: node.k8s.io/v1
kind: RuntimeClass
metadata:
  name: kata
handler: kata
scheduling:
  nodeSelector:
    kata-enabled: "true"
EOF

# Create a stuck pod that uses kata for step 3
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: stuck-pod
spec:
  runtimeClassName: kata
  containers:
  - name: c1
    image: busybox:1.36
    command: ["sleep", "3600"]
EOF

echo "done" >> /opt/.backgroundfinished

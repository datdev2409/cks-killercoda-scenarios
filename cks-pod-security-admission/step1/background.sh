#!/bin/bash

# Setup dev-team namespace
kubectl create namespace dev-team

# Setup secure-ns namespace for Step 3
kubectl create namespace secure-ns
kubectl label namespace secure-ns pod-security.kubernetes.io/enforce=restricted

# Create failing pod manifest for Step 3
cat <<EOF > /root/failing-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  namespace: secure-ns
spec:
  containers:
  - name: nginx
    image: busybox:1.36
    command: ["sleep", "3600"]
EOF

echo "done" >> /opt/.backgroundfinished

#!/bin/bash

# Create workspace
mkdir -p ~/.kubernetes-binaries
cd ~/.kubernetes-binaries

# Fetch valid kubeadm and its raw checksum, then format it correctly
curl --retry 3 --retry-delay 2 -sLf "https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubeadm" -o kubeadm
curl --retry 3 --retry-delay 2 -sLf "https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubeadm.sha256" -o kubeadm.sha256
echo "  kubeadm" >> kubeadm.sha256

# Fetch valid kubelet and its raw checksum, then format it correctly
curl --retry 3 --retry-delay 2 -sLf "https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubelet" -o kubelet
curl --retry 3 --retry-delay 2 -sLf "https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubelet.sha256" -o kubelet.sha256
echo "  kubelet" >> kubelet.sha256

# Tamper with the kubelet binary slightly to break the hash
echo "malicious_payload" >> kubelet

echo "done" > /opt/background-finished

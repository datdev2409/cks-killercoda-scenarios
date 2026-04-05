#!/bin/bash
# Wait for the control plane to be ready
while ! kubectl get nodes | grep -w "Ready"; do
  sleep 2
done

# Step 1 background prep: Overly privileged default SA in backend namespace
kubectl create namespace backend
kubectl create namespace dev

# Create api-server pod using the default SA in backend namespace
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: api-server
  namespace: backend
spec:
  containers:
  - name: nginx
    image: nginx:1.21.6
EOF

# Create a terrifyingly open clusterrolebinding for this SA
kubectl create clusterrolebinding default-admin-binding \
  --clusterrole=cluster-admin \
  --serviceaccount=backend:default

# Step 2 background prep: Create user user dev-john
openssl genrsa -out /root/dev-john.key 2048
openssl req -new -key /root/dev-john.key -out /root/dev-john.csr -subj "/CN=dev-john/O=developers"

cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: dev-john
spec:
  request: $(cat /root/dev-john.csr | base64 | tr -d '\n')
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
EOF

kubectl certificate approve dev-john

# Extract the cert
kubectl get csr dev-john -o jsonpath='{.status.certificate}' | base64 -d > /root/dev-john.crt

# Setup dev-john kubeconfig
kubectl config set-credentials dev-john \
  --client-certificate=/root/dev-john.crt \
  --client-key=/root/dev-john.key \
  --embed-certs=true

kubectl config set-context dev-john-context \
  --cluster=kubernetes \
  --user=dev-john \
  --namespace=dev

touch /opt/.backgroundfinished

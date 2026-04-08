#!/bin/bash

# Probe etcd for the db-credentials secret and verify it is encrypted
ETCDCTL_API=3 etcdctl \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  get /registry/secrets/default/db-credentials | grep -q 'k8s:enc:aescbc:v1:'

if [ $? -eq 0 ]; then
  exit 0
else
  exit 1
fi

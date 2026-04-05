#!/bin/bash

# Check 1: The overly permissive binding MUST NOT exist
if kubectl get clusterrolebinding default-admin-binding >/dev/null 2>&1; then
  exit 1
fi

# Check 2: Can the default SA in backend get secrets in backend?
if ! kubectl auth can-i get secrets --as=system:serviceaccount:backend:default -n backend | grep -q "yes"; then
  exit 1
fi

# Check 3: Make sure it cannot delete secrets in kube-system (ensuring cluster-admin is actually gone)
if ! kubectl auth can-i delete secrets --as=system:serviceaccount:backend:default -n kube-system | grep -q "no"; then
  exit 1
fi

exit 0

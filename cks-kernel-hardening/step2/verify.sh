#!/bin/bash
# Check if profile loaded into aa-status
if ! aa-status | grep -q "custom-k8s-deny-write"; then
  exit 1
fi

# Check if pod is running
if ! kubectl get pod hardened-pod | grep -q "Running"; then
  exit 1
fi

# Check annotation (or modern security context)
HAS_ANNOTATION=false
if kubectl get pod hardened-pod -o jsonpath='{.metadata.annotations}' | grep -qi "custom-k8s-deny-write"; then
  HAS_ANNOTATION=true
fi
if kubectl get pod hardened-pod -o jsonpath='{.spec.containers[0].securityContext.appArmorProfile.localhostProfile}' | grep -qi "custom-k8s-deny-write"; then
  HAS_ANNOTATION=true
fi

if [ "$HAS_ANNOTATION" = false ]; then
  exit 1
fi

# Check if write is actually blocked inside the container
if kubectl exec hardened-pod -- touch /usr/share/testfile 2>&1 | grep -q "Permission denied"; then
  exit 0
fi

exit 1

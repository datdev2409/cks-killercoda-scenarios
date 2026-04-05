#!/bin/bash

# Check 1: dev-john can create pods in dev
if ! kubectl auth can-i create pods --as=dev-john -n dev | grep -q "^yes$"; then
  exit 1
fi

# Check 2: dev-john can delete deployments in dev
if ! kubectl auth can-i delete deployments.apps --as=dev-john -n dev | grep -q "^yes$"; then
  exit 1
fi

# Check 3: dev-john CANNOT create pods in default
if ! kubectl auth can-i create pods --as=dev-john -n default | grep -q "^no$"; then
  exit 1
fi

exit 0

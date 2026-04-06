#!/bin/bash
# Check if profile is active in aa-status
if ! aa-status | grep -q "/usr/local/bin/test-app.sh"; then
  exit 1
fi

# Verify it actually blocks the touch command
if /usr/local/bin/test-app.sh 2>&1 | grep -q "Permission denied"; then
  exit 0
fi

# If it executes without "permission denied", it's still unsecured
exit 1

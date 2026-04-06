#!/bin/bash
# Check if profile is active in aa-status AND in complain mode
if ! aa-status | grep -A 5 "profiles are in complain mode" | grep -q "/usr/local/bin/test-app.sh"; then
  exit 1
fi

# Ensure the forbidden file was successfully created (proving complain mode allows writes)
if [ ! -f /tmp/forbidden ]; then
  exit 1
fi

exit 0

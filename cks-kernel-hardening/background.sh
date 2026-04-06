#!/bin/bash
# Wait for the control plane to be ready
while ! kubectl get nodes | grep -w "Ready"; do
  sleep 2
done

# ----------------------------------------
# Step 1: Host AppArmor Prep
# ----------------------------------------
# Create a script that tries to write to a forbidden path
cat << 'EOF' > /usr/local/bin/test-app.sh
#!/bin/bash
touch /tmp/forbidden
echo "Successfully touched /tmp/forbidden"
EOF
chmod +x /usr/local/bin/test-app.sh

# Create the AppArmor profile targeting this specific path
cat << 'EOF' > /root/host-profile
#include <tunables/global>

/usr/local/bin/test-app.sh {
  #include <abstractions/base>
  #include <abstractions/bash>

  /usr/local/bin/test-app.sh r,
  /bin/bash ix,
  /usr/bin/touch mrix,
  /usr/bin/coreutils mrix,
  /dev/tty rw,
  
  allow /tmp/ rw,
  deny /tmp/forbidden w,
}
EOF

# ----------------------------------------
# Step 2: K8s AppArmor Prep
# ----------------------------------------
# Create the k8s AppArmor profile
cat << 'EOF' > /root/k8s-profile
#include <tunables/global>

profile custom-k8s-deny-write flags=(attach_disconnected) {
  #include <abstractions/base>

  file,
  
  # Deny all file writes in /usr/share/
  deny /usr/share/** w,
}
EOF

# Provide a pod template
cat << 'EOF' > /root/pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: hardened-pod
spec:
  containers:
  - name: secure-container
    image: busybox
    command: ["sh", "-c", "sleep 3600"]
EOF

touch /opt/.backgroundfinished

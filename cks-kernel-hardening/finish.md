# Scenario Complete!

Excellent work! 

You successfully demonstrated the duality of AppArmor usage:
1. By profiling `/usr/local/bin/test-app.sh`, you witnessed how host processes are **automatically** confined by their paths in the Linux filesystem.
2. By deploying the `hardened-pod`, you witnessed how Kubernetes bypasses absolute paths and instead relies on **labeled profiles** (e.g. `localhost/custom-k8s-deny-write`) loaded manually into the kubelet context using the `flags=(attach_disconnected)` declaration.

Understanding this distinction is vital not only to secure your infrastructure against container breakouts but to secure the host node services themselves!

Good luck on your CKS Exam!

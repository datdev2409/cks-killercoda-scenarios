# Verify Platform Binaries Before Deploying

Welcome to this scenario on Supply Chain Security! 

In a secure Kubernetes cluster, you must ensure that all binaries (like `kubelet`, `kubeadm`, `kubectl`) downloaded from the internet have not been secretly modified by attackers. To prevent this **supply chain attack**, you must verify the cryptographic hash of the downloaded binaries against the official checksum provided by the Kubernetes release team.

In this scenario, a setup script has downloaded the `kubeadm` and `kubelet` binaries into `~/.kubernetes-binaries/`, but one of them has been compromised! Let's find out which one and secure it.

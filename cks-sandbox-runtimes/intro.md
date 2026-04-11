# Sandbox Environments (gVisor & Kata)

Welcome to the Sandbox Environments scenario!

In the CKS exam, you won't be asked to heavily modify OS-level kernel modules or manually install the binaries for **Kata Containers** or **gVisor**. However, you *absolutely* will be tested on how to configure Kubernetes resources to utilize them once they are installed.

Sandboxes provide an extra layer of isolation between containerized applications and the host system's kernel, significantly reducing the attack surface.

### What you will learn:
1. Creating a `RuntimeClass` resource to map handlers in the cluster.
2. Refactoring live pods to inject a `runtimeClassName`.
3. Troubleshooting why sandboxed pods are stuck in `Pending` state via `nodeSelectors`.

Let's jump in!

# Congratulations!

You've mastered the core Kubernetes configurations related to Container Sandboxes for the CKS exam!

**Key Takeaways:**
- The `RuntimeClass` resource is the bridge between Kubernetes pods and the CRI (Container Runtime Interface) handlers like `runsc` or `kata`.
- You cannot patch a `runtimeClassName` into an already running pod; you must extract its YAML, add the field, and recreate it (`kubectl replace --force`).
- To verify a gVisor pod from the inside, `dmesg | grep -i gvisor` is a highly reliable command.
- When sandboxed pods are stuck in a `Pending` state, always check the `RuntimeClass` for strict `nodeSelector` requirements and align your node labels appropriately!

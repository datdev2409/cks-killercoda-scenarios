# Verification & Troubleshooting

Sometimes sandboxing components are configured only on specific instances containing specific hardware footprints (such as nested virtualization capabilities). 

Because of this, `RuntimeClass` resources often utilize `nodeSelector` or `tolerations` to ensure any pods requesting the sandbox get strictly bound to those capable nodes.

In your cluster, there is a pod currently stuck in a pending state called `stuck-pod` that uses the `kata` RuntimeClass.

## Task
Troubleshoot why the pod is stuck, and label the active node appropriately so Kubernetes can successfully schedule it.

*(Note: Without actual Kata containers installed on this environment sandbox, the pod will eventually throw a runtime error as it fails to initialize the sandbox, but you simply need to unblock it from the `Pending` state!)*

<br/>
<details>
  <summary>Hint: Troubleshooting flow</summary>
  
  1. Inspect the pod: `kubectl describe pod stuck-pod`. You'll see a node selector mismatch.
  2. Inspect the RuntimeClass: `kubectl get runtimeclass kata -o yaml`. Notice the `scheduling.nodeSelector`.
  3. Find your node name: `kubectl get nodes`.
  4. Label the node: `kubectl label node <node-name> kata-enabled=true`.
  5. The pod will immediately begin scheduling (transitioning from Pending to ContainerCreating).
</details>

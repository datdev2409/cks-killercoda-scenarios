# Create a RuntimeClass for a Sandbox

The exam may provide you with a pre-installed runtime handler on the OS nodes (like `runsc` for gVisor or `kata` for Kata Containers) and ask you to make it available to the cluster via Kubernetes APIs.

## Task
Create a `RuntimeClass` resource named `untrusted` that uses the `runsc` handler.

**Exam Tip:** Ensure the handler name matches exactly what the question provides. It is often `runsc` for gVisor!

<br/>
<details>
  <summary>Hint</summary>
  
  You need to construct a YAML file from scratch since there is no `kubectl create runtimeclass` imperative command.

  ```yaml
  apiVersion: node.k8s.io/v1
  kind: RuntimeClass
  metadata:
    name: untrusted
  handler: runsc
  ```
  
  Apply it using `kubectl apply -f file.yaml`.
</details>

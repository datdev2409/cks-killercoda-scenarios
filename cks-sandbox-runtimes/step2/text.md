# Refactor an Existing Pod

You might be given an existing Pod running in the default namespace and told its workload is "untrusted" or "malicious." You must securely sandbox it.

In your cluster, there is a pod running named `internal-processor`.

There is also a pre-existing RuntimeClass named `gvisor` configured in the cluster.

## Task
Update the `internal-processor` pod to run using the `gvisor` RuntimeClass.

**Important:** You cannot edit the `runtimeClassName` field of an already running pod dynamically. You must extract it, modify it, and recreate it.

<br/>
<details>
  <summary>Hint: Steps to refactor</summary>
  
  1. Save the YAML: `kubectl get pod internal-processor -o yaml > pod.yaml`
  2. Edit the file, adding `runtimeClassName: gvisor` under the `spec` section.
  3. Replace the Pod forcefully: `kubectl replace --force -f pod.yaml`
</details>

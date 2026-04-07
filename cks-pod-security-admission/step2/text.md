# Global Admission Configuration

In this step, you will configure PSA at the cluster level. This involves editing a configuration file and pointing the API server to it, establishing default policies cluster-wide.

## Task

Configure the Pod Security Admission controller via the kube-apiserver to use the `restricted` profile as the global default for all namespaces, while exempting the `kube-system` namespace.

**What you need to do:**
1. Create a PodSecurityConfiguration file at `/etc/kubernetes/admission/psa-config.yaml`.
2. Define the exact defaults (enforce: restricted) and exemptions (exempt kube-system namespace) in this configuration.
3. Update the `kube-apiserver` manifest (`/etc/kubernetes/manifests/kube-apiserver.yaml`) to use this configuration file using the `--admission-control-config-file` argument.
4. (Tip) Ensure that the file path `/etc/kubernetes/admission` is accessible inside the kube-apiserver pod via `volumeMounts` and `volumes` (if it isn't already covered by existing mounts like `/etc/kubernetes`).

*Wait for the kube-apiserver to restart and apply the changes before verifying.*

<br/>
<details>
  <summary>Hint</summary>
  
  Your PodSecurityConfiguration file should look something like this:
  
  ```yaml
  apiVersion: apiserver.config.k8s.io/v1
  kind: AdmissionConfiguration
  plugins:
  - name: PodSecurity
    configuration:
      apiVersion: pod-security.admission.config.k8s.io/v1
      kind: PodSecurityConfiguration
      defaults:
        enforce: "restricted"
        enforce-version: "latest"
      exemptions:
        namespaces: ["kube-system"]
  ```

</details>

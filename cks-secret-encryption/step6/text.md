# Scenario 6: Multi-Resource Encryption

You are almost done!

By default, the CKS exam will definitely focus on `secrets`. However, the EncryptionConfiguration is capable of encrypting essentially any API resource in Kubernetes.

## Task
You are tasked with ensuring that not only secrets are encrypted, but also `configmaps`.

**What you need to do:**
1. Re-enable the `aescbc` provider at the top of the `providers:` block (move `identity: {}` back to the bottom).
2. Look at the `resources:` array in your `/etc/kubernetes/enc/enc.yaml` file. Add `configmaps` to the list so both resources reside under the same encryption provider strategy.

<br/>
<details>
  <summary>Hint</summary>

  ```yaml
  apiVersion: apiserver.config.k8s.io/v1
  kind: EncryptionConfiguration
  resources:
    - resources:
        - secrets
        - configmaps
      providers:
        - aescbc: # ...
  ```
</details>

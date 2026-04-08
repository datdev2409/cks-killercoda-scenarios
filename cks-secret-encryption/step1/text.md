# Scenario 1: Enable Encryption for the First Time

Currently, the Secrets in the cluster are stored as Base64 plaintext. 

## Task
You must enable encryption at rest for `secrets` using the `aescbc` provider.

**What you need to do:**
1. Generate a valid 32-byte key (e.g., using `head -c 32 /dev/urandom | base64`).
2. Create an `EncryptionConfiguration` file at `/etc/kubernetes/enc/enc.yaml`.
3. Configure the file to use your new key under the `aescbc` provider. Keep the `identity` provider as the fallback.
4. Update the `kube-apiserver` static pod manifest to include the `--encryption-provider-config=/etc/kubernetes/enc/enc.yaml` flag.
5. Ensure you mount the `/etc/kubernetes/enc` directory into the kube-apiserver pod using `hostPath` volumes so the apiserver can read the configuration file!

*Wait for the kube-apiserver to restart before moving to the next step.*

<br/>
<details>
  <summary>Hint: Example enc.yaml</summary>

  ```yaml
  apiVersion: apiserver.config.k8s.io/v1
  kind: EncryptionConfiguration
  resources:
    - resources:
        - secrets
      providers:
        - aescbc:
            keys:
              - name: key1
                secret: <BASE64_KEY>
        - identity: {}
  ```
</details>

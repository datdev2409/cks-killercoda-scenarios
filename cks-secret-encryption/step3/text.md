# Scenario 3: Encrypting Pre-existing Secrets

You have successfully enabled encryption and verified it for new secrets! However, there is a catch.

Any secrets that were created **before** you enabled encryption remain stored in plaintext until they are updated. In the background of this lab, a secret named `db-credentials` was spawned before you modified the API server.

If you query etcd for `/registry/secrets/default/db-credentials` right now, you will see its plaintext data.

## Task
You must force the API server to perform a "bulk update" replacing all existing secrets so they get encrypted and re-saved into `etcd`.

**What you need to do:**
Run a command to capture all secrets and `replace` them in the API. This simply "touches" every secret, prompting the `aescbc` encryption provider to convert them on overwrite.

<br/>
<details>
  <summary>Hint: The Bulk Replace Command</summary>

  ```bash
  kubectl get secrets --all-namespaces -o json | kubectl replace -f -
  ```
</details>

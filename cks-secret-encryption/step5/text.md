# Scenario 5: Reverting to Plaintext (Identity Provider)

Sometimes, after an incident or migration, you might be instructed to completely disable encryption and return all cluster data back to its original plaintext format.

## Task
Revert all secrets back to plaintext (Base64 only).

**What you need to do:**
1. Remember that the API server evaluates `providers` from top to bottom.
2. Edit `/etc/kubernetes/enc/enc.yaml`.
3. Move `- identity: {}` to the very top of the `providers:` list. This tells the API server to write all **new** data as-is.
4. Wait for the `kube-apiserver` to restart.
5. Run the `kubectl replace` command again to decrypt all existing secrets back into plaintext in `etcd`.

<br/>
<details>
  <summary>Hint: Revert providers</summary>

  ```yaml
      providers:
        - identity: {}
        - aescbc:
            keys:
              - name: key2
  ```
  Once you restart the API server, re-run `kubectl get secrets --all-namespaces -o json | kubectl replace -f -`
</details>

# Scenario 4: Key Rotation (Zero Downtime)

Your organization's security policy states that encryption keys must be rotated periodically. To comply, you need to replace your old key with a newly generated one without losing access to current Secrets.

## Task
Configure the `EncryptionConfiguration` file to support a new key. The API server evaluates keys from top to bottom. The first key in the provider list is the "write" key, and any subsequent keys in the list are used to "read" existing data.

**What you need to do:**
1. Generate another 32-byte key.
2. Edit `/etc/kubernetes/enc/enc.yaml`.
3. Add the **new** key as the first entry under the `aescbc` provider's list of `keys` (name it `key2`).
4. Keep the **old** key as the second entry so existing secrets can still be decrypted.
5. (In a real scenario, you would wait for apiserver to restart, run the bulk replace command again, and then safely delete the old key).

*For this step, simply modifying the file with both keys is sufficient to pass!*

<br/>
<details>
  <summary>Hint: Key structure</summary>

  ```yaml
        - aescbc:
            keys:
              - name: key2
                secret: <NEW_BASE64_KEY>
              - name: key1
                secret: <OLD_BASE64_KEY>        
  ```
</details>

# Manage Kubernetes Secrets (Encryption at Rest)

Welcome to the **Secret Encryption** scenario!

By default, Kubernetes Secrets are stored unencrypted in the underlying `etcd` data store (they are merely Base64 encoded). This represents a significant security risk if the node hosting `etcd` is compromised or backups fall into the wrong hands.

In this scenario, you will configure Kubernetes to securely encrypt secrets at rest using the API server's encryption provider feature.

### What you will learn:
1. Enabling `aescbc` encryption for Secrets.
2. Directly querying `etcd` via `etcdctl` to verify encryption states.
3. Bulk encrypting previously created, unencrypted secrets.
4. Safely rotating encryption keys with zero downtime.
5. Disabling encryption using the `identity` provider to revert to plaintext.
6. Expanding encryption configuration to cover multiple resources like `ConfigMaps`.

Click **Start** to begin testing your skills!

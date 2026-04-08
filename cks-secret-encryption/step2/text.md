# Scenario 2: Verify Encryption State via etcdctl

## Task
You must prove that a newly created Secret is indeed encrypted at rest.

1. First, create a new secret called `new-secret` in the `default` namespace. 
   ```kubectl create secret generic new-secret --from-literal=pass=1234`{{execute}}``
2. Next, construct an `etcdctl` command to read this secret directly from the `etcd` database.
3. Save the full output of the `etcdctl get` command for this secret into the file `/root/etcd-proof.txt`.

**What to Look For:**
Since the `aescbc` encryption provider is active, the output in `/root/etcd-proof.txt` should start with a prefix like `k8s:enc:aescbc:v1:key1...`.

<br/>
<details>
  <summary>Hint: etcdctl command</summary>

  You will need to pass the proper PKI certificates found in `/etc/kubernetes/pki/etcd/` to authenticate the command:
  
  ```bash
  ETCDCTL_API=3 etcdctl \
    --endpoints=https://127.0.0.1:2379 \
    --cacert=/etc/kubernetes/pki/etcd/ca.crt \
    --cert=/etc/kubernetes/pki/etcd/server.crt \
    --key=/etc/kubernetes/pki/etcd/server.key \
    get /registry/secrets/default/new-secret > /root/etcd-proof.txt
  ```
</details>

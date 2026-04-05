# Step 3: Remediation & Secure Download

Since the first downloaded `kubelet` binary was compromised, you must now safely download a fresh one directly from the authoritative source and verify it.

Using the `v1.30.0` release URL, download the official binary:

`curl -sL "https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubelet" -o kubelet`{{execute}}

Now, verify it one more time using the original, trusted `.sha256` checksum file that we still have in the directory:

`sha256sum --check kubelet.sha256`{{execute}}

If it says `kubelet: OK`, you have successfully secured the supply chain! 
Move it to `/usr/local/bin/`:

`sudo mv kubelet /usr/local/bin/kubelet`{{execute}}

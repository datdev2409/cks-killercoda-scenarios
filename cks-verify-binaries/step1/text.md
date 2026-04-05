# Step 1: Verify the Intact Binary

Let's navigate to our working directory:
`cd ~/.kubernetes-binaries/`{{execute}}

Let's see what is inside:
`ls -la`{{execute}}

You will see `kubeadm` and `kubeadm.sha256`. 

### What is a Checksum?
A checksum mathematically calculates a unique, fixed-length hash for a file. By comparing the hash of our locally downloaded binary against the official hash published by the Kubernetes release team, we can guarantee that the file content hasn't been corrupted over the network download or tampered with by an attacker.

### The `--check` Option
To perform this verification, we use the `sha256sum --check` command. 
The `--check` option simply automates the comparison. It reads the `.sha256` file, computes the hash for the local binary, and verifies they match. 
*Note: The `.sha256` file must strictly follow the format `<hash>  <filename>` (with exactly two spaces separating the hash and filename) for the `--check` flag to parse it correctly!*

Let's verify `kubeadm`:

`sha256sum --check kubeadm.sha256`{{execute}}

If it returns `kubeadm: OK`, you know the binary is completely safe.
To complete this step, move the valid binary to `/usr/local/bin/` so it is installed and available in the system path:

`sudo mv kubeadm /usr/local/bin/kubeadm`{{execute}}

# Step 1: Verify the Intact Binary

Let's navigate to our working directory:
`cd ~/.kubernetes-binaries/`{{execute}}

Let's see what is inside:
`ls -la`{{execute}}

You will see `kubeadm` and `kubeadm.sha256`. 

### What is a Checksum?
A checksum mathematically calculates a unique, fixed-length hash for a file. By comparing the hash of our locally downloaded binary against the official hash published by the Kubernetes release team, we can guarantee that the file content hasn't been corrupted over the network download or tampered with by an attacker.

### The `--check` Option
We *could* simply run `sha256sum kubeadm` to calculate the hash, and then manually compare that long string against the official text file. However, to eliminate human error, we can automate this verification using the `--check` option. 

The `--check` option automates the comparison for us: it reads our `.sha256` file, computes the actual hash for the local `kubeadm` binary, and verifies that they perfectly match. 
*Note: The `.sha256` file must strictly follow the format `<hash>  <filename>` (with exactly two spaces separating the hash and filename) for the `--check` flag to parse it correctly!*

Let's verify `kubeadm`:

`sha256sum --check kubeadm.sha256`{{execute}}

If it returns `kubeadm: OK`, you know the binary is completely safe.
To complete this step, move the valid binary to `/usr/local/bin/` so it is installed and available in the system path:

`sudo mv kubeadm /usr/local/bin/kubeadm`{{execute}}

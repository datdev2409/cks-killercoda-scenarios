# Step 1: Verify the Intact Binary

Let's navigate to our working directory:
`cd ~/.kubernetes-binaries/`{{execute}}

Let's see what is inside:
`ls -la`{{execute}}

You will see `kubeadm` and `kubeadm.sha256`. Let's verify `kubeadm`.
Run the built-in `sha256sum` tool with the `--check` flag to read the `.sha256` file and automatically verify the binary:

`sha256sum --check kubeadm.sha256`{{execute}}

If it returns `kubeadm: OK`, you know the binary is safe.
To complete this step, move the valid binary to `/usr/local/bin/` so it is installed and available in the system path:

`sudo mv kubeadm /usr/local/bin/kubeadm`{{execute}}

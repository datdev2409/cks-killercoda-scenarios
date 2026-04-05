# Step 2: Detect the Tampered Binary

Now let's check the `kubelet` binary:

`cd ~/.kubernetes-binaries/`{{execute}}

Run the verification tool against its checksum file:

`sha256sum --check kubelet.sha256`{{execute}}

You should see: `kubelet: FAILED`. The computed checksum did NOT match the official hash! This means the binary was either corrupted during download or tampered with by a malicious actor.

To complete this step, delete the compromised binary to prevent accidental deployment:

`rm kubelet`{{execute}}

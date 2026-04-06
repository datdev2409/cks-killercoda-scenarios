# Confining a Kubernetes Pod

For generic container workloads, AppArmor profiles are loaded differently. Instead of locking down a specific hardcoded bin path, they use a generic `profile` name and are explicitly attached to containers via Pod metadata.

A profile structure `custom-k8s-deny-write` is provided at `/root/k8s-profile`.

### Your Task:

1. **Load the Profile**: Load `/root/k8s-profile` into the node kernel using `apparmor_parser`.
2. **Attach to Container**: Edit the `/root/pod.yaml` manifest. Using annotations, attach the `localhost/custom-k8s-deny-write` profile to the `secure-container` container.
   - *Example annotation formula:*
     `container.apparmor.security.beta.kubernetes.io/<container-name>: localhost/<profile-name>`
3. **Deploy**: Apply the edited `/root/pod.yaml`.

Once deployed, the verification script will `kubectl exec` into your pod and attempt to `touch /usr/share/testfile`. If everything is configured correctly, it will be strictly denied!

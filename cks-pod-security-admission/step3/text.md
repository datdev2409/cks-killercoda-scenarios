# Troubleshooting "Forbidden" Pods

Often in the exam, you might be given a manifest that fails to deploy and asked to fix it so it complies with a namespace's PSA policy.

In the background, a namespace named `secure-ns` was created and labeled with `enforce=restricted`.

## Task

You try to run the pod defined in `/root/failing-pod.yaml`, but it is rejected by the API server because it doesn't define a compliant `securityContext`.

Modify the manifest `/root/failing-pod.yaml` so the Pod can be successfully created and run in the `secure-ns` namespace. 

Apply the manifest when you are done.

*Requirements:*
- The pod name and namespace must stay the same (`nginx` in `secure-ns`).
- The securityContext must encompass the restricted profile requirements (run as non-root, drop ALL capabilities, disallow privilege escalation, use RuntimeDefault seccomp profile).

<br/>
<details>
  <summary>Hint</summary>
  
  You need to add a `securityContext` at both the Pod level and the Container level.
  
  ```yaml
  spec:
    securityContext:
      runAsNonRoot: true
      runAsUser: 1000
      seccompProfile:
        type: RuntimeDefault
    containers:
    - name: nginx
      # ...
      securityContext:
        allowPrivilegeEscalation: false
        capabilities:
          drop: ["ALL"]
  ```

</details>

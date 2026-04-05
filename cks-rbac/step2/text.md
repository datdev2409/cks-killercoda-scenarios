# Granting Contextual Access (Users)

A developer whose identity is `dev-john` has been successfully authenticated against the cluster. However, he is currently encountering an RBAC error stating that he cannot list pods!

A `dev` namespace already exists. You need to authorise `dev-john` so he can work.

### Tasks

1.  **Create a targeted Role**: Create a `Role` named `dev-deployer` in the `dev` namespace. It should allow the actions `create, get, list, delete` for both `deployments` and `pods` (Note: deployments belong to the `apps` apiGroup).
2.  **Create the RoleBinding**: Create a `RoleBinding` named `dev-deployer-binding` in the `dev` namespace linking the `dev-deployer` Role to the **User** `dev-john`.

Once completed, `dev-john` should be able to create pods in the `dev` namespace, but not in `default` or `kube-system`.

To test it as `dev-john`, you can use the pre-configured context or `--as`:
```bash
kubectl auth can-i create pods --as=dev-john -n dev
```{{execute}}

# Restricting Pod Permissions (ServiceAccounts)

A poorly configured cluster has given the `default` ServiceAccount in the `backend` namespace full `cluster-admin` rights! Let's fix this.

### Tasks

1.  **Identify and Delete the permissive binding**: Find the specific `ClusterRoleBinding` named `default-admin-binding` that is tied to `backend:default` and delete it.
2.  **Create a scoped Role**: Create a `Role` named `backend-secret-reader` in the `backend` namespace that solely allows verbs `get` and `list` on resources `secrets`.
3.  **Bind the Role**: Create a `RoleBinding` named `backend-secret-reader-binding` in the `backend` namespace linking the `backend-secret-reader` role to the `default` ServiceAccount in the `backend` namespace.

You can verify the issue beforehand and after your fix using `auth can-i`:
```bash
kubectl auth can-i delete secrets --as=system:serviceaccount:backend:default -n kube-system
```{{execute}}
*This should return `no` after you apply your fix, and `yes` to `get` secrets in `backend`.*

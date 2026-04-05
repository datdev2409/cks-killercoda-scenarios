# Restricting ServiceAccount and User Permissions

Welcome to the RBAC security scenario!

In an ideal zero-trust environment, every Pod, ServiceAccount, and User should have the minimum permissions necessary to function. However, environments often grow with overly permissive `ClusterRoleBindings` created for convenience.

## Your Task
Your environment is suffering from a massive security leak:
1. The `default` service account in the `backend` namespace has been granted `cluster-admin` privileges across the entire cluster!
2. A developer `dev-john` has a newly created certificate to access the cluster but lacks permission to do their work.

Wait for the environment to finish starting up, and then proceed to the first step to fix these vulnerabilities.

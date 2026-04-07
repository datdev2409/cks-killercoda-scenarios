# Namespace Labeling Scenarios

The most common way Pod Security Admission (PSA) appears is through namespace labeling. You will likely be asked to modify an existing namespace or create a new one with specific security constraints.

A namespace named `dev-team` has already been created for you.

## Task
Enforce the `baseline` security profile on the `dev-team` namespace. 
Additionally, configure it so that users receive warnings if their pods violate the `restricted` profile.

**Requirement Checklist:**
- The `dev-team` namespace must enforce the `baseline` PSA profile.
- The `dev-team` namespace must warn on the `restricted` PSA profile.
- The policies should apply to the latest version of the standards (which is the default when you don't explicitly specify a version).

<br/>
<details>
  <summary>Hint</summary>
  
  You can apply labels to the namespace using `kubectl label namespace <name> <key>=<value>`.
  
  The label keys for PSA follow this pattern: `pod-security.kubernetes.io/<mode>=<profile>`

</details>

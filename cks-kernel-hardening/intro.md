# Kernel Hardening via AppArmor

Welcome to the AppArmor security scenario!

AppArmor is a Linux kernel security module that allows the system administrator to restrict programs' capabilities with per-program profiles.

In this interactive lab, we are going to explore the two primary ways AppArmor profiles are bound to execution execution contexts:
1. **Host-level auto-confinement**: Mapping a profile to an absolute path of a binary. Once loaded, ANY execution of that binary on the system automatically falls under the rules of the profile.
2. **Kubernetes container-level confinement**: Loading generic sandbox profiles into the node, and manually attaching them to a `Pod` via the Kubernetes API.

Wait for the background script to provision your test executables and vulnerable pods, then jump right into Step 1.

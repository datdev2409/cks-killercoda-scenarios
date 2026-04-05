---
name: Generate CKS Exercises
description: A skill to analyze a CKS study plan and generate technical design proposals for hands-on Killercoda scenarios based on upcoming topics.
---

# Generate CKS Exercises

This skill acts as the brainstorming and design interface for translating theoretical CKS study topics into actionable, interactive Killercoda exercises. It reads a provided study plan, picks an appropriate topic, and defines the technical constraints required to simulate that topic in a hands-on environment.

## Steps to Execute

When invoked to generate a CKS exercise, perform the following steps:

1. **Read the Study Plan**:
   - Use the `view_file` tool to examine `CKS_Study_Plan.md`.
   - Identify topics that are marked as uncompleted or upcoming. 
   - Choose one clear focus area (e.g., Network Policies, PSP/PSA, RBAC, Kubelet Security, Auditing).

2. **Design the Technical Scenario Proposal**:
   - Create a realistic, broken or insecure starting state that represents a common failure point or security leak in the Kubernetes exam context. 
   - Define clear objectives for the user to securely reconfigure the environment.
   - Outline the steps visually.
   - You must NOT write any actual code files (like `index.json` or `.sh` files) during this skill. You are purely designing the proposal.

3. **Format the Output Proposal**:
   Present your proposed scenario to the user in a clear markdown structure:
   
   - **Topic Area**: (e.g., Kubelet Hardening)
   - **Scenario Title**: (e.g., Securing Unauthenticated Kubelet API)
   - **Base Environment Needed**: (e.g., `kubernetes-kubeadm-2nodes`)
   - **Initial Vulnerable State (Background Setup)**: (e.g., "Kubelet is running with `anonymous: true` and `readOnlyPort: 10255`. A background script needs to modify `/var/lib/kubelet/config.yaml` and restart kubelet before the user starts.")
   - **Steps Outline**:
     - *Step 1*: Goal (e.g., Observe vulnerability via curl), Verification logic (e.g., Verify curl fails after fixing)
     - *Step 2*: Goal (e.g., Modify `config.yaml`), Verification logic (e.g., Verify config contains webhook authorization)
   
4. **Obtain Approval**:
   - Ask the user to approve this technical proposal before proceeding to generate the actual files out of it.
   - Inform the user that they can edit the `CKS_Study_Plan.md` file to update completed topics explicitly.

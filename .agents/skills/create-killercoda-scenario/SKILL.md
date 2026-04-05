---
name: Create Killercoda Scenario
description: A skill to scaffold and create new Killercoda scenarios, including steps, verification scripts, and foreground/background initialization.
---

# Create Killercoda Scenario

This skill helps you generate a structured Killercoda scenario from scratch. It handles the folder creation, configuration files, instructional markdown, and necessary foreground/background scripts.

## Steps to Execute

When asked to create a Killercoda scenario, perform the following steps:

1. **Ask for Clarification** (If not provided):
   - What is the title and topic of the scenario (e.g., CKS Network Policies, Kubernetes RBAC)?
   - How many steps will there be?
   - Do we need validation/verification scripts for the steps?
   - Does this need a foreground/background startup script?

2. **Scaffold the Scenario Directory**:
   Create a new directory for the scenario within the repository.
   - Example: `mkdir -p <scenario-name>/step1`

3. **Generate `index.json`**:
   Create the primary configuration file in the root of the new directory. This should define the `title`, `description`, `details` (steps, intro, finish), and `backend` environment.

   **Available `backend.imageid` environments:**
   - `kubernetes-kubeadm-2nodes`: Multi-node Kubernetes (1 control-plane, 1 worker). Ideal for CKS/networking scenarios.
   - `kubernetes-kubeadm-1node`: Simple single-node Kubernetes.
   - `ubuntu`: Standard clean Ubuntu Linux environment.
   
   *Example Structure:*
   ```json
   {
     "title": "Scenario Title",
     "description": "Short description.",
     "details": {
       "steps": [
         {
           "title": "Step 1",
           "text": "step1/text.md",
           "verify": "step1/verify.sh"
         }
       ],
       "intro": {
         "text": "intro.md"
       },
       "finish": {
         "text": "finish.md"
       }
     },
     "environment": {
       "uilayout": "terminal"
     },
     "backend": {
       "imageid": "kubernetes-kubeadm-2nodes"
     }
   }
   ```

4. **Generate the Markdown Files**:
   - `intro.md`: Briefly explain the goal of the scenario.
   - `stepX/text.md` (or `stepX.md`): Write the specific task instructions. Remember to use `{{execute}}` on commands to make them clickable within the Killercoda UI.
   - `finish.md`: A basic wrap-up message.

5. **Generate Verification Scripts (If applicable)**:
   - Within each step, create the validation shell scripts (e.g., `stepX/verify.sh`).
   - The script must return `0` for success or `1` for failure.
   - Example validation: `kubectl get pods -n secure-namespace | grep -q 'Running'`

6. **Generate Foreground/Background Scripts (If applicable)**:
   - For foreground initialization (e.g., showing a progress spinner), create `foreground.sh` executing visible preparation tasks.
   - For background setup (e.g., creating secret vulnerable pods behind the scenes), create `background.sh` running silently.
   *(These are referenced in `index.json` either per-step or globally depending on Killercoda V1/V2 syntax).*

7. **Update `structure.json` (If using a structured path)**
   - Add the relative path of the new scenario directory to the `structure.json` at the root of the repository so Killercoda recognizes its order in a course.

## Important Note
Always ensure that the steps utilize interactive Markdown components such as `` `kubectl get nodes`{{execute}} `` to optimize the interactive learning experience!

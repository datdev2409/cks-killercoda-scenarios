---
description: An end-to-end workflow to generate CKS Killercoda scenarios based on your study plan.
---

# Generate Killercoda Scenarios from Study Plan

This workflow bridges the gap between your conceptual study plan and the actual implementation of hands-on interactive scenarios. It chains together the `Generate CKS Exercises` skill to brainstorm the idea and the `Create Killercoda Scenario` skill to write the code.

1. First, invoke the **Generate CKS Exercises** skill. It will read `CKS_Study_Plan.md`, pick an open topic, and produce a unified technical design proposal outlining what the Killercoda exercise should look like.
2. Wait for the user to review and explicitly approve this proposal.
3. Once the user approves the technical design, invoke the **Create Killercoda Scenario** skill to systematically scaffold the files, initialize the `index.json`, build the steps, and write the bash verification scripts exactly as outlined in the previously approved proposal.

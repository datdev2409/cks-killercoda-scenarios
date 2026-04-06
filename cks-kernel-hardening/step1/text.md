# Confining a Host Process

Host processes can be automatically confined simply by mapping an AppArmor profile to the absolute path of the executable.

A script `/usr/local/bin/test-app.sh` is provided. If you run it right now, it will successfully create a file at `/tmp/forbidden`. Let's block it!

An AppArmor profile for this exact script is provided at `/root/host-profile`.

### Your Task:
1. Examine `/root/host-profile`. Notice how the profile block explicitly targets `/usr/local/bin/test-app.sh`.
2. Load the profile into the Linux kernel using the `apparmor_parser` command.
3. Try executing `/usr/local/bin/test-app.sh` again to verify that it is automatically blocked from writing!

*(Note: In Ubuntu environments, `apparmor_parser` sometimes needs the `-q` quiet flag or just the path itself!)*

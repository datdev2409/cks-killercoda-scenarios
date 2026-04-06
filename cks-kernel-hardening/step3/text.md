# Complain Mode and Logging

AppArmor profiles can operate in two modes:
- **Enforce Mode** (Default): Violations are actively blocked and logged.
- **Complain Mode**: Violations are *permitted* to run, but are silently logged. This is critical when developing or testing profiles in production so you don't inadvertently crash your applications!

### Your Task:

1. **Remove Explicit Deny**: Here is a vital CKS concept: **Complain mode bypasses IMPLICIT denies, but explicit `deny` rules are STILL strictly enforced!** 
   Since our `/root/host-profile` has an explicit `deny /tmp/forbidden w,`, complain mode will STILL block it!
   Open `/root/host-profile` using `nano` or `vim`, and **delete** the `deny /tmp/forbidden w,` line.

2. **Switch to Complain Mode**: Now, use the `-C` (complain) flag with `apparmor_parser` to reload the edited host profile into the kernel. 
   ```bash
   apparmor_parser -r -C /root/host-profile
   ```{{execute}}

3. **Run the Script**: Execute `/usr/local/bin/test-app.sh` again. This time, it will successfully touch the forbidden file because AppArmor is no longer enforcing the denial!
   ```bash
   /usr/local/bin/test-app.sh
   ```{{execute}}

4. **Check the Logs**: Now prove that AppArmor still saw it and complained! Search the syslog or kernel ring buffer (`dmesg`) for the AppArmor audit message indicating an "ALLOWED" event for the requested `w` (write) permission.
   ```bash
   grep -i apparmor /var/log/syslog | tail
   ```{{execute}}
   or
   ```bash
   dmesg | grep -i apparmor | tail
   ```{{execute}}

Once you read the log and see the `apparmor="ALLOWED"`, hit check!

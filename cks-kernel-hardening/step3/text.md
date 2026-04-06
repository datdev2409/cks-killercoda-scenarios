# Complain Mode and Logging

AppArmor profiles can operate in two modes:
- **Enforce Mode** (Default): Violations are actively blocked and logged.
- **Complain Mode**: Violations are *permitted* to run, but are silently logged. This is critical when developing or testing profiles in production so you don't inadvertently crash your applications!

### Your Task:

1. **Switch to Complain Mode**: Use the `-C` (complain) flag with `apparmor_parser` to reload our existing host profile into complain mode. By using `-r` (replace), we overwrite the strict profile with the complain-mode profile in the kernel.
   ```bash
   apparmor_parser -r -C /root/host-profile
   ```{{execute}}
   *Note: While Ubuntu provides an `aa-complain` helper script, `apparmor_parser` is the lowest-level and most reliable way to force a profile mode without parsing conflicting files elsewhere on the filesystem!*

2. **Run the Script**: Execute `/usr/local/bin/test-app.sh` again. This time, it will successfully touch the forbidden file because AppArmor is no longer enforcing the denial!
   ```bash
   /usr/local/bin/test-app.sh
   ```{{execute}}

3. **Check the Logs**: Now prove that AppArmor still saw it and complained! Search the syslog or kernel ring buffer (`dmesg`) for the AppArmor audit message indicating an "ALLOWED" event for the requested `w` (write) permission.
   ```bash
   grep -i apparmor /var/log/syslog | tail
   ```{{execute}}
   or
   ```bash
   dmesg | grep -i apparmor | tail
   ```{{execute}}

Once you read the log and see the `apparmor="ALLOWED"`, hit check!

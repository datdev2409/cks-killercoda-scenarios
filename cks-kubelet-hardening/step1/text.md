## Task: Secure the Kubelet

Before we secure the cluster, let's observe how dangerous the current Kubelet configuration is!
Try querying the Kubelet API on the **read-only port (10255)** without any authentication:
`curl -sk http://localhost:10255/pods`{{execute}}
*(You should see an unprotected list of all pods running on the node!)*

Now try hitting the **secure port (10250)** anonymously (without a token):
`curl -sk https://localhost:10250/pods`{{execute}}
*(If anonymous auth is enabled, this will also shockingly return pod details instead of 'Unauthorized'!)*

### The Fix
Your task is to modify the Kubelet configuration on the control plane node to meet the following security requirements:
1. Ensure the **read-only port** is disabled (set to `0`).
2. Prevent **unauthenticated access** (disable anonymous authentication).

The primary configuration file for the Kubelet is located at `/var/lib/kubelet/config.yaml`. 

You can edit the file directly using:
`vi /var/lib/kubelet/config.yaml`{{execute}}

*Hint: Look for the `authentication.anonymous.enabled` key inside the file to change it to `false` and set `readOnlyPort: 0`.*

Once you have saved your changes, be sure to restart the kubelet service:
`systemctl restart kubelet`{{execute}}

### Verify the Fix
Now that you have restarted the Kubelet, try running the exact same queries again!
`curl -sk http://localhost:10255/pods`{{execute}} *(This should now fail to connect).*
`curl -sk https://localhost:10250/pods`{{execute}} *(This should now return "Unauthorized").*

When you see that access is properly restricted, press the Check button below!

{{verify(verify.sh)}}

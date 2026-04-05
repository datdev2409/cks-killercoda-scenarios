# CKS Study Plan

**Reference**: [Official Killercoda CKS Scenarios](https://killercoda.com/killer-shell-cks)

## Cluster Setup (15%)

### Use Network security policies to restrict cluster level access
- [x] Theory
- [x] Practice
  - [Official: NetworkPolicy Create Default Deny](https://killercoda.com/killer-shell-cks/scenario/networkpolicy-create-default-deny)
  - [Custom: cks-network-policies](https://killercoda.com/datdev2409/scenario/cks-network-policies)

### Use CIS benchmark to review the security configuration of Kubernetes components (etcd, kubelet, kubedns, kubeapi)
- [x] Theory
- [x] Practice
  - [Official: CIS Benchmarks fix Controlplane](https://killercoda.com/killer-shell-cks/scenario/cis-benchmarks-kube-bench-fix-controlplane)
  - [Custom: cks-cis-benchmark](https://killercoda.com/datdev2409/scenario/cks-cis-benchmark)

### Properly set up Ingress with TLS
- [x] Theory
- [x] Practice
  - [Official: Ingress Secure](https://killercoda.com/killer-shell-cks/scenario/ingress-secure)
  - [Custom: cks-ingress-tls](https://killercoda.com/datdev2409/scenario/cks-ingress-tls)

### Protect node metadata and endpoints
- [x] Theory
- [x] Practice
  - [Official: NetworkPolicy Metadata Protection](https://killercoda.com/killer-shell-cks/scenario/networkpolicy-metadata-protection)
  - [Custom: cks-node-metadata](https://killercoda.com/datdev2409/scenario/cks-node-metadata)

### Verify platform binaries before deploying
- [x] Theory
- [x] Practice
  - [Official: Verify Platform Binaries](https://killercoda.com/killer-shell-cks/scenario/verify-platform-binaries)
  - [Custom: cks-verify-binaries](https://killercoda.com/datdev2409/scenario/cks-verify-binaries)

## Cluster Hardening (15%)

### Use Role Based Access Controls to minimize exposure
- [x] Theory
- [ ] Practice
  - [Official: RBAC ServiceAccount Permissions](https://killercoda.com/killer-shell-cks/scenario/rbac-serviceaccount-permissions)
  - [Custom: cks-rbac](https://killercoda.com/datdev2409/scenario/cks-rbac)

### Exercise caution in using service accounts e.g. disable defaults, minimize permissions on newly created ones
- [ ] Theory
- [ ] Practice
  - [Official: Secret ServiceAccount Pod](https://killercoda.com/killer-shell-cks/scenario/secret-serviceaccount-pod)
  - [Custom: cks-service-accounts](https://killercoda.com/datdev2409/scenario/cks-service-accounts)

### Restrict access to Kubernetes API
- [ ] Theory
- [ ] Practice
  - [Official: Apiserver NodeRestriction](https://killercoda.com/killer-shell-cks/scenario/apiserver-noderestriction)
  - [Custom: cks-api-restriction](https://killercoda.com/datdev2409/scenario/cks-api-restriction)

### Upgrade Kubernetes to avoid vulnerabilities
- [ ] Theory
- [ ] Practice
  - [Official: Exam Desktop](https://killercoda.com/killer-shell-cks/scenario/playground-exam-desktop)
  - [Custom: cks-kube-upgrade](https://killercoda.com/datdev2409/scenario/cks-kube-upgrade)

## System Hardening (10%)

### Minimize host OS footprint (reduce attack surface)
- [ ] Theory
- [ ] Practice
  - [Official: System Hardening Close Open Ports](https://killercoda.com/killer-shell-cks/scenario/system-hardening-close-open-ports)
  - [Custom: cks-os-footprint](https://killercoda.com/datdev2409/scenario/cks-os-footprint)

### Using least-privilege identity and access management
- [ ] Theory
- [ ] Practice
  - [Official: Privilege Escalation Containers](https://killercoda.com/killer-shell-cks/scenario/privilege-escalation-containers)
  - [Custom: cks-iam-least-privilege](https://killercoda.com/datdev2409/scenario/cks-iam-least-privilege)

### Minimize external access to the network
- [ ] Theory
- [ ] Practice
  - [Official: System Hardening Manage Packages](https://killercoda.com/killer-shell-cks/scenario/system-hardening-manage-packages)
  - [Custom: cks-network-access](https://killercoda.com/datdev2409/scenario/cks-network-access)

### Appropriately use kernel hardening tools such as AppArmor, seccomp
- [ ] Theory
- [ ] Practice
  - [Official: AppArmor](https://killercoda.com/killer-shell-cks/scenario/apparmor)
  - [Custom: cks-kernel-hardening](https://killercoda.com/datdev2409/scenario/cks-kernel-hardening)

## Minimize Microservice Vulnerabilities (20%)

### Use appropriate pod security standards
- [ ] Theory
- [ ] Practice
  - [Official: Container Hardening](https://killercoda.com/killer-shell-cks/scenario/container-hardening)
  - [Custom: cks-pod-security](https://killercoda.com/datdev2409/scenario/cks-pod-security)

### Manage Kubernetes secrets
- [ ] Theory
- [ ] Practice
  - [Official: Secret ETCD Encryption](https://killercoda.com/killer-shell-cks/scenario/secret-etcd-encryption)
  - [Custom: cks-manage-secrets](https://killercoda.com/datdev2409/scenario/cks-manage-secrets)

### Understand and implement isolation techniques (multi-tenancy, sandboxed containers, etc.)
- [ ] Theory
- [ ] Practice
  - [Official: Sandbox gVisor](https://killercoda.com/killer-shell-cks/scenario/sandbox-gvisor)
  - [Custom: cks-workload-isolation](https://killercoda.com/datdev2409/scenario/cks-workload-isolation)

### Implement Pod-to-Pod encryption (Cilium, Istio)
- [ ] Theory
- [ ] Practice
  - [Official: Playground Cilium](https://killercoda.com/killer-shell-cks/scenario/playground-cilium)
  - [Custom: cks-pod-encryption](https://killercoda.com/datdev2409/scenario/cks-pod-encryption)

## Supply Chain Security (20%)

### Minimize base image footprint
- [ ] Theory
- [ ] Practice
  - [Official: Container Image Footprint User](https://killercoda.com/killer-shell-cks/scenario/container-image-footprint-user)
  - [Custom: cks-base-image](https://killercoda.com/datdev2409/scenario/cks-base-image)

### Understand your supply chain (e.g. SBOM, CI/CD, artifact repositories)
- [ ] Theory
- [ ] Practice
  - [Official: Image Use Digest](https://killercoda.com/killer-shell-cks/scenario/image-use-digest)
  - [Custom: cks-supply-chain](https://killercoda.com/datdev2409/scenario/cks-supply-chain)

### Secure your supply chain (permitted registries, sign and validate artifacts, etc.)
- [ ] Theory
- [ ] Practice
  - [Official: ImagePolicyWebhook Setup](https://killercoda.com/killer-shell-cks/scenario/imagepolicywebhook-setup)
  - [Custom: cks-secure-supply-chain](https://killercoda.com/datdev2409/scenario/cks-secure-supply-chain)

### Perform static analysis of user workloads and container images (e.g. Kubesec, KubeLinter)
- [ ] Theory
- [ ] Practice
  - [Official: Static Manual Analysis K8s](https://killercoda.com/killer-shell-cks/scenario/static-manual-analysis-k8s)
  - [Custom: cks-static-analysis](https://killercoda.com/datdev2409/scenario/cks-static-analysis)

## Monitoring, Logging and Runtime Security (20%)

### Perform behavioral analytics to detect malicious activities
- [ ] Theory
- [ ] Practice
  - [Official: Falco Change Rule](https://killercoda.com/killer-shell-cks/scenario/falco-change-rule)
  - [Custom: cks-behavioral-analytics](https://killercoda.com/datdev2409/scenario/cks-behavioral-analytics)

### Detect threats within physical infrastructure, apps, networks, data, users and workloads
- [ ] Theory
- [ ] Practice
  - [Official: Image Vulnerability Scanning Trivy](https://killercoda.com/killer-shell-cks/scenario/image-vulnerability-scanning-trivy)
  - [Custom: cks-threat-detection](https://killercoda.com/datdev2409/scenario/cks-threat-detection)

### Investigate and identify phases of attack and bad actors within the environment
- [ ] Theory
- [ ] Practice
  - [Official: Syscall Activity Strace](https://killercoda.com/killer-shell-cks/scenario/syscall-activity-strace)
  - [Custom: cks-incident-investigation](https://killercoda.com/datdev2409/scenario/cks-incident-investigation)

### Ensure immutability of containers at runtime
- [ ] Theory
- [ ] Practice
  - [Official: Immutability Readonly Filesystem](https://killercoda.com/killer-shell-cks/scenario/immutability-readonly-filesystem)
  - [Custom: cks-immutable-containers](https://killercoda.com/datdev2409/scenario/cks-immutable-containers)

### Use Kubernetes audit logs to monitor access
- [ ] Theory
- [ ] Practice
  - [Official: Auditing Enable Audit Logging](https://killercoda.com/killer-shell-cks/scenario/auditing-enable-audit-logs)
  - [Custom: cks-audit-logs](https://killercoda.com/datdev2409/scenario/cks-audit-logs)
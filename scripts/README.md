This README file contains the command to be used to run the Scripts and Policy 

Scripts
### 1. System Health Monitoring

Script: scripts/system_health.py

Checks:

CPU usage (>80%)

Memory usage (>80%)

Disk space (>80%)

Running processes

Run:
python3 scripts/system_health.py


### 2. Automated Backup Solution

Script: scripts/backup.sh

Creates a backup of a specified directory to a remote server.
Edit the script to set your destination (rsync or scp).

Run:
chmod +x scripts/backup.sh
./scripts/backup.sh /path/to/directory


### 3. Zero-Trust with KubeArmor

Policy: policies/wisecow-zero-trust.yaml

Apply to cluster:
kubectl apply -f policies/wisecow-zero-trust.yaml


Check for violations:
kubectl logs -n kube-system -l kubearmor-app=kubearmor


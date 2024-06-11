# Run on admin-01
scp -rp ansible@10.1.22.2:/app/repo /tmp/repo_backup

# Run on workstation
scp -rp ansible@10.1.22.2:/app/repo ~/repo_backup/foldername
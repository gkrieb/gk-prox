# Add ansible user
adduser ansible

# Add ansible to admins group
pw group mod admins -m ansible

# Needs to be added to patch cycle - fixes pkg/sudo errors
pkg-static update -fq
pkg-static upgrade -fq

# Install sudo
pkg install -fq pfSense-pkg-sudo

# Add user as sudoer
ansible ALL=(ALL) NOPASSWD: ALL
#!/bin/bash
yum update -y
yum install -y openssh-server
systemctl start sshd
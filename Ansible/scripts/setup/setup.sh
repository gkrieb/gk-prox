#!/bin/bash
HOST=10.1.23.60


ssh-copy-id -o ProxyJump=10.1.22.3 $HOST
ssh -o ProxyJump=10.1.22.3 $HOST
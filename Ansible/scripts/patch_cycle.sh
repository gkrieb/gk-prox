#!/bin/bash
ansible-playbook \
    -i ~/gk-prox/Ansible/inventories/gk-prox-inv.yml \
    --tags "patch_cycle" \
    ~/gk-prox/Ansible/prod.yml 

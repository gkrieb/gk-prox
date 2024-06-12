#!/bin/bash
ansible-playbook \
    -i ../inventories/gk-prox-inv.yml \
    --tags "patch_cycle" \
    ../prod.yml 

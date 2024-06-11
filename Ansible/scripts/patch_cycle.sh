#!/bin/bash
ansible-playbook \
    -i ../inventories/gk-prox-inv.yml \
    --ask-become-pass \
    --tags "patch_cycle" \
    ../prod.yml 

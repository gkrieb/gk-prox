#!/bin/bash
ansible-playbook \
    -i ../inventories/gk-prox-inv.yml \
    --ask-become-pass \
    --tags "shutdown_cycle" \
    ../prod.yml 

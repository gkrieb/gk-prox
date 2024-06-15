#!/bin/bash
ansible-playbook \
    -i ../inventories/gk-prox-inv.yml \
    --tags "shutdown_cycle" \
    ../prod.yml 

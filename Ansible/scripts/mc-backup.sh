#!/bin/bash
ansible-playbook \
    -i ../inventories/gk-prox-inv.yml \
    --tags "mc-backup" \
    ../prod.yml 

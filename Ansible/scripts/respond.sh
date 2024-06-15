#!/bin/bash
ansible-playbook \
    -i ../inventories/gk-prox-inv.yml \
    --tags "respond" \
    ../prod.yml 
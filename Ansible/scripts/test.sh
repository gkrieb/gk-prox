#!/bin/bash
ansible-playbook \
    -i ../inventories/gk-prox-inv.yml \
    ../test.yml 

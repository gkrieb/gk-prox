#!/bin/bash
HOST=10.1.23.105


#ssh ansible@$HOST  -o ProxyCommand="ssh -W %h:%p ansible@10.1.22.3 -i ~/.ssh/id_rsa"
ssh ansible@$HOST
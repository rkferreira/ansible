#!/bin/bash

set -v


export ANSIBLE_CONFIG="${PWD}/cf_ansible.cfg"

##ansible-playbook --connection=local --inventory 127.0.0.1, $1 -vv --check --diff
##ansible-playbook --connection=local --inventory 127.0.0.1, $1 -vv
# ./run_deploy_cf.sh playbooks/myapp10.yaml -vv --check --diff
#

ansible-playbook --connection=local --inventory 127.0.0.1, $@

exit $?

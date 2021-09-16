#!/bin/bash

set -v


export ANSIBLE_CONFIG="${PWD}/servers_ansible.cfg"

ansible-playbook --connection=local --inventory 127.0.0.1, playbooks/servers/$1.yaml -v

exit $?

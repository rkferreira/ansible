#!/bin/bash

if [[ $1 && `ls $1` ]]; then
	/usr/bin/ansible-playbook -i $1 ./playbooks/list_users.yml
else
	echo -e "$0 : Please specify host invetary file as parameter\n\n"
	echo -e "\t$0 hostinvetoryfile				       \n"
fi

#!/bin/bash

if [[ $1 && `ls $1` ]]; then
	awk '{print "ansible "$3" -m user -a \"name="$1" state=absent remove=yes --become\" "}' $1
else
	 echo -e "$0 :\tPlease specify a list with users to be deleted as parameter.\n\t\t\tScript result will be a list of ready commands to run and delete users.\n\n"
         echo -e "\t$0 userstobedeleted                                             \n"
fi

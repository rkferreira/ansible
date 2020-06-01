# ANSIBLE

## RUN SAMPLE

```
#ansible-playbook playbook.yaml -i servers.yaml --extra-vars "tgt_host=master" -b -v --check
```

## AWS dynamic inventory sample

aws cli must be working

Files currently assume you have some aws profiles set in HOME/.aws/(config|credential). Tweak it as necessary for your use.


Test to see the inventory:
```
ansible-inventory -i inventory/dynamic.aws_ec2.yml --graph
```

Test ad-hoc command:
```
ansible -i inventory/dynamic.aws_ec2.yml server01 -m ping -u ec2-user --private-key=~/.ssh/mykey.pem
```

Test playbook:
```
ansible-playbook playbooks/my-playbook.yaml -i inventory/dynamic.aws_ec2.yml --extra-vars "tgt_host=server01" -b -v --check -u ec2-user --private-key=~/.ssh/mykey.pem
```



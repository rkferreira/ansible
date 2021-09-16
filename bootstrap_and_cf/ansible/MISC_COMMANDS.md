## Check appgw servers

```
ansible -i inventory/myapp.appgw.aws_ec2.yml appgw -a '/usr/local/bin/janus.sh ping'

ansible -i inventory/myapp.appgw.aws_ec2.yml appgw -m ping
```

### Fleet managing

```
ansible-playbook -i inventory/myapp.appgw.aws_ec2.yml -l appgw-asg-010e0f5fba6067ba2 --list-hosts  playbooks/ping.yaml

ansible-playbook -i inventory/myapp.appgw.aws_ec2.yml -l appgw-asg-010e0f5fba6067ba2  playbooks/ping.yaml

ansible-playbook -i inventory/myapp.appgw.aws_ec2.yml -l appgw-asg-010e0f5fba6067ba2  playbooks/servers/appgw-test.yaml -t janus_logrotate -b --check --diff
ansible-playbook -i inventory/myapp.appgw.aws_ec2.yml -l appgw-asg-010e0f5fba6067ba2  playbooks/servers/appgw-test.yaml -t janus_logrotate -b

#get ip_addresses
ansible -i inventory/myapp.appgw.aws_ec2.yml appgw -m setup -a 'filter=ansible_all_ipv4*'
```


### Inventory checking

```
ansible-inventory -i inventory/myapp.appgw.aws_ec2.yml --graph
```


### SSH console

```
#caution
#ansible-console -i inventory/myapp.appgw.aws_ec2.yml appgw

```

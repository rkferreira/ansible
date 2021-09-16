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
ansible-inventory -i inventory/myapp.aws_ec2.yml --graph
```

Test ad-hoc command:
```
ansible -i inventory/myapp.aws_ec2.yml sre-new01 -m ping -u ec2-user --private-key=~/.ssh/myapp.pem
```

Test playbook:
```
ansible-playbook playbooks/myapp-playbook.yaml -i inventory/myapp.aws_ec2.yml --extra-vars "tgt_host=sre-new01" -b -v --check -u ec2-user --private-key=~/.ssh/myapp.pem
```

## TV sample

```
ansible-playbook playbooks/myapp-elbapi-playbook.yaml -i inventory/myapp.aws_ec2.yml --extra-vars "tgt_host=i-rrefs234reww" -u ec2-user --private-key=~/.ssh/myapp.pem -b -v

# inventory by id, in case of auto scaling group
#hostnames:
#  - instance-id
```

## Ansible config

https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings

```
The configuration file
Changes can be made and used in a configuration file which will be searched for in the following order:

ANSIBLE_CONFIG (environment variable if set)
ansible.cfg (in the current directory)
~/.ansible.cfg (in the home directory)
/etc/ansible/ansible.cfg
```

## Ansible Galaxy

```
ansible-galaxy install nginxinc.nginx
```

https://galaxy.ansible.com/


## Codecommit

### Configure codecommit

https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-https-unixes.html
https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-mirror-repo-pushes.html

MacOs https://docs.aws.amazon.com/codecommit/latest/userguide/troubleshooting-ch.html

```
mkdir repodir

git init
git config credential.helper '!aws codecommit credential-helper $@'
#profile specifi##git config credential.helper '!aws --profile sre-tv codecommit credential-helper $@'
git config credential.UseHttpPath true

git remote add origin https://git-codecommit.us-east-1.amazonaws.com/v1/repos/sre
git config branch.master.remote origin
git config branch.master.merge refs/heads/master
git fetch --all
```


#!/bin/sh

export ANSIBLE_CALLBACK_PLUGINS=$(python3 -m ara.setup.callback_plugins)
echo $ANSIBLE_CALLBACK_PLUGINS

#curl -L https://github.com/theprotos/lab-iac/archive/refs/heads/master.zip -o /tmp/repo.zip
#7z x /tmp/repo.zip -o/tmp/example4 lab-iac-master/ansible/ansible-repo/*.* -r


ara-manage migrate
ansible -i inventory.yaml all -m ping
ansible-playbook -i inventory.yaml install-py-play.yaml
#ansible -i inventory.yaml all -m setup | grep -i distribution

#ansible-playbook -i inventory.yaml demo-play.yaml

ara playbook list
ara-manage runserver 0.0.0.0:8000

exec "$@"

#!/bin/sh

cp /tmp/ansible/ansible.pub /home/ansible/.ssh/authorized_keys 2>/dev/null || :
chown ansible:ansible /home/ansible/.ssh/authorized_keys 2>/dev/null || :
cp /tmp/ansible.key/ansible /home/ansible/.ssh/ansible 2>/dev/null || :
chown ansible:ansible /home/ansible/.ssh/ansible 2>/dev/null || :

#export ANSIBLE_CALLBACK_PLUGINS=$(python3 -m ara.setup.callback_plugins)
#echo $ANSIBLE_CALLBACK_PLUGINS

ara-manage migrate
ansible -i inventories all -m ping #-vvvv
ansible-inventory -i inventories --graph
ansible-playbook -i inventory playbooks/install-py-play.yaml
#ansible -i inventory.yaml all -m setup | grep -i distribution
#ansible-playbook -i inventory.yaml demo-play.yaml
#ansible-playbook -i inventory.yaml install-py-play.yaml
#ara playbook list
#ara-manage runserver 0.0.0.0:8000

exec "$@"

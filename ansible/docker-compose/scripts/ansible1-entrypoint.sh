#!/bin/sh

cp /tmp/ansible/ansible.pub /home/ansible/.ssh/authorized_keys 2>/dev/null || :
chmod ansible:ansible /home/ansible/.ssh/authorized_keys 2>/dev/null || :

export ANSIBLE_CALLBACK_PLUGINS=$(python3 -m ara.setup.callback_plugins)

mkdir -p /var/run/sshd
/usr/sbin/sshd -D -e

ara-manage migrate
ansible -i inventories all -m ping #-vvvv
ansible-playbook -i inventory playbooks/install-py-play.yaml
#ansible -i inventory.yaml all -m setup | grep -i distribution

#ansible-playbook -i inventory.yaml demo-play.yaml

ara playbook list
ara-manage runserver 0.0.0.0:8000

exec "$@"

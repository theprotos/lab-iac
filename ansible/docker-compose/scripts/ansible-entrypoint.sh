#!/bin/sh

export ANSIBLE_CALLBACK_PLUGINS=$(python3 -m ara.setup.callback_plugins)

echo $ANSIBLE_CALLBACK_PLUGINS

ara-manage migrate
ansible -i inventory.yaml all -m ping
ansible-playbook -i inventory.yaml playbook.yaml
ara playbook list
ara-manage runserver 0.0.0.0:8000

exec "$@"

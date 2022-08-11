#!/bin/bash
cp /tmp/ansible/ansible.pub /home/ansible/.ssh/authorized_keys 2>/dev/null || :
chmod ansible:ansible /home/ansible/.ssh/authorized_keys 2>/dev/null || :
service ssh restart
# systemctl start sshd
exec "$@"

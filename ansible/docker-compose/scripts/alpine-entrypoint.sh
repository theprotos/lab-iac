#!/bin/sh
cp /tmp/ansible/ansible.pub /home/ansible/.ssh/authorized_keys 2>/dev/null || :
chown ansible:ansible /home/ansible/.ssh/authorized_keys 2>/dev/null || :
# service ssh restart
# systemctl start sshd
rc-status
rc-service -i sshd restart
tail -f dev/null
exec "$@"

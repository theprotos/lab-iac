#!/bin/bash
cp /tmp/ansible/ansible.pub /home/ansible/.ssh/authorized_keys 2>/dev/null || :
chown ansible:ansible /home/ansible/.ssh/authorized_keys 2>/dev/null || :
rm -rf /run/nologin
# ssh-keygen -A
# service ssh restart
#systemctl start sshd
/usr/sbin/sshd -D -e
exec "$@"

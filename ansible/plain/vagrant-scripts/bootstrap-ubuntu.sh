#!/usr/bin/bash

printf "\n  [$(date +'%Y-%m-%dT%H:%M:%S%z')]: ========== UBUNTU BOOTSTRAP STARTED ============"

printf "\n  [$(date +'%Y-%m-%dT%H:%M:%S%z')]: SSH enable password login"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && printf "\tSSH [ OK ]"
systemctl reload sshd

printf "\n  [$(date +'%Y-%m-%dT%H:%M:%S%z')]: Install pip"
apt-get -y -qq update && printf "\n\tupdate [ OK ]"
apt-get -y -qq install git python3-pip ca-certificates curl && printf "\n\tpip [ OK ]"

useradd -m ansible -s /bin/bash || true
python3 -m pip install --user ansible

printf "\n  [$(date +'%Y-%m-%dT%H:%M:%S%z')]: Clean packages"
apt-get autoremove -y -q
apt-get clean -y -q

printf "\n  [$(date +'%Y-%m-%dT%H:%M:%S%z')]: ========== BOOTSTRAP COMPLETED ============"

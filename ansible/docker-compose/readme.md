## Ansible env

Consists of:
- ansible + [ARA](http://localhost:8000/)
- [vault](http://localhost:8200/)
- node_alpine
- node_redhat
- node_ubuntu
- node_rockylinux

Run 
```
docker-compose up --build
```

Restart
```
docker-compose down -v
docker-compose up --build
```

Connect to ansible
```
docker exec -it ansible1 bash
ansible -i inventory.yaml all -m setup | grep -i distribution
ansible -i inventory.yaml all -m ping
ansible-playbook -i inventory.yaml playbook.yaml
ansible-playbook -i inventory.yaml install-py-play.yaml
```

Run ARA
```
python3 -m ara.setup.callback_plugins
export ANSIBLE_CALLBACK_PLUGINS=$(python3 -m ara.setup.callback_plugins)
ara-manage migrate
ansible-playbook -i inventory.yaml playbook.yaml
ara playbook list
ara-manage runserver 0.0.0.0:8000
```


Troubleshooting
```
docker exec -it ansible bash
ping node-ubuntu 
ssh -i ~/.ssh/ansible node-ubuntu
ssh-copy-id -i ~/.ssh/ansible.pub ansible@node-ubuntu


docker exec -it node-ubuntu bash
service --status-all
service ssh start
```

```
docker build -t myubuntu -f .\Dockerfile.ubuntu .
docker run -it myubuntu bash
docker build -t mymaster -f .\Dockerfile.master .
```


ansible-doc -t connection -l
ansible-inventory -i inventory.yaml --graph



ansible-vault create file.yml

ansible-vault edit file.yml


python -m virtualenv --version
python -m virtualenv ansible
.\ansible\Scripts\activate.ps1
pip list
pip install ansible-vault

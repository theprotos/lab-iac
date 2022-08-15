## Ansible env

Consists of:
- ansible
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
docker exec -it ansible bash
ansible -i inventory.yaml all -m ping
ansible -i inventory.yaml all -m setup
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


amazonlinux





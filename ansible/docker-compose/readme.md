
docker-compose down -v
docker-compose up --build

```
docker exec -it ansible-master bash
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
ansible -i inventory.yaml all -m ping

amazonlinux





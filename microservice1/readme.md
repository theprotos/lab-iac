# Simple microservice

## Description

- Returns current position of MKS
- Returns localhost system stats
- Convert JSON tp Prometheus metrics
- Prometheus to collect metrics

## Start env

via Vagrant (it will run docker-compose)
```
vagrant up
```

via docker-compose
```
cd apps
docker-compose up --build
```


- [prometheus](http://localhost:9090)
- [OS stats](http://localhost:8080)
- [MKS position](http://localhost:8081)
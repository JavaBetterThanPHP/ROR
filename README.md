# Ruby On Rails x Vuejs x Traefik Docker dev env
Feel free to fork it and use any front framework you need !

## Getting started :

To fully use the dev env, you need a unix env (in order to use traefik)

### prerequisites :

- yarn
- make
- docker
- docker-compose

**Build**
```
docker-compose build
```

**run**
```
make run
```

**Congrats ! Your app is running**

Front : myproject.test
Back : api.myproject.test

*You can change the urls in the docker-compose.yml & in .docker/traefik/traefik.toml*



## Others commands :

**Start**
```
make up
```


**Install front packages**
```
make install
```

**Clean front packages**
```
make clean-front
```

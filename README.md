# Railium - Ruby On Rails x Reactjs

## GETTING STARTED

#### Container

```bash
$ docker-compose up --build
```

```
ctrl + C 

or

$ docker-compose stop
```

#### Front

```
$ docker-compose run client yarn install
```

#### BDD & Rake

```
$ docker-compose run ruby rake db:drop

$ docker-compose run ruby rake db:create

$ docker-compose run ruby rake db:migrate

$ docker-compose run ruby rake db:seed
```


#### Lancement

```
$ docker-compose up
```

Front : http://127.0.0.1:3001

Back : http://127.0.0.1:3000


## SWAGGER

```
$ docker-compose run ruby rake swag:specs:swaggerize
```

Swagger access : http://0.0.0.0:3000/api-docs/index.html


## POSTMAN DOC : 

API DOC : https://documenter.getpostman.com/view/5336370/SVSPmmWQ?version=latest#intro

IMPORT POSTMAN WITH UNIT TESTS: https://www.getpostman.com/collections/207d128632ad98dbc075
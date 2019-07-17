# Ruby On Rails x Reactjs x Traefik Docker dev env

## Getting started :

To fully use the dev env, you need a unix env 

**Build**
```
docker-compose build
```
or 

**run**
```
make run
```

**Congrats ! Your app is running**

Front : myproject.test (port = 7000)

Back : api.myproject.test (back = 3000)

*You can change the urls in the docker-compose.yml & in .docker/traefik/traefik.toml*

**Initialize the database**
Run `rails db:seed' in rails console

## Others commands :

**Start**
```
make up
```

**Install front packages**
```
make install
```

**Stop the project**
```
make down
```

**Create the database**
```
make create-db
```

**Run the migration**
```
make migrate-db
```

**Drop the database**
```
make drop-db
```

**Bash for ruby  API**
```
make bash
```

**Clean front packages**
```
make clean-front
```

**Swagger**

http://0.0.0.0:3000/api-docs/index.html

**Sign up**

http://localhost:3000/users/sign_up
{
"email":"lorenzo.canavaggio111@laposte.net",
"password":"test",
"password_confirmation": "test",
"birthdate":"Mar, 28 Mar 1991",
"description":"Web Developer",
"profilePictureUrl":"https://www.docker.com/sites/default/files/social/docker_facebook_share.png",
"inscriptionDate":"Mar, 28 Mar 1991",
"firstname":"Canavaggio",
"lastname":"Lorenzo"
}

this gives the JWT token in headers

Every other request requires the token in header ex :
"Authorization" : "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMTQsImV4cCI6MTU1OTU3NjExNywiaWF0IjoxNTU5NDg5NzE3fQ.qTMieYZz8IkGPdp1JXpm1aRq3l730QaZbWRwAVrBV-k"

**Access rails container from Docker**

`docker exec -ti [container] bash`
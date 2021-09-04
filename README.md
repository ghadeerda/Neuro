# The current tasks were done:

1- create nginx image from the Dockerfile

the file includes copying files:

* nginx.conf: configure the nginx
* script.py: a python script to create a table in postgres database
* script.sh: a bash script to do the same

2-creat the nginx container using the docker-compose, and set to listen on port 9000

3-create a postgres container which listens on port 5432

4- the two containers are connected using the link in docker-compose

5- additional: yml files to run the previous services as deployments in k8s

## To run the tasks
1- copy all files to the same dir

2- build the nginx image with:

`docker-compose build`
docke
3-run the containers with:

`docker-compose up -d`

4-test on the url:

`nginx-dev.eastus.cloudapp.azure.com:9000`

5-download scripts from

`nginx-dev.eastus.cloudapp.azure.com:9000/script.py`
`nginx-dev.eastus.cloudapp.azure.com:9000/script.sh`

6-you can test the script by going into nginx container and run the script

`docker-compose exec -it nginx-container bash`

`cd /usr/share/nginx/html`

`./script.sh -d slowplanet -u root -h db `

7-cleanup

`docker-compose down`

`docker rmi nginx postgres`

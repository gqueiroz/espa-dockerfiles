docker ps -a | grep $1 | awk '{print $1}' | xargs docker stop
docker ps -a | grep $1 | awk '{print $1}' | xargs docker rm

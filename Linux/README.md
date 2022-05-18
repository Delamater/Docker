# Building a linux docker container based on Ubuntu
## How To Execute Build
docker build -t myubuntu-dev -f .\Dockerfile.ubuntu .

# Description
Ubuntu's 20.10 image repositories changed, this docker build file helps us update the repositories and allows apt-get to work normally
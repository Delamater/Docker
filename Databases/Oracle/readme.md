# How To Build Oracle Docker Images Locally
## Requirements
To build and use an Oracle docker image using the https://github.com/oracle/docker-images repository within this docker example repository the following prerequisites are required. 
1. You must have an Oracle account to pull their installation bits
2. If you are on Windows you must create a WSL 2 image, in our case, Ubuntu 22. 
- This means you must have access to either the Microsoft Store. 
- Or you can manually download the WSL images here (see section titled Downloading distributions): https://docs.microsoft.com/en-us/windows/wsl/install-manual
3. You must pull the docker-images submodule.
4. Docker must be installed on your host system

### Oracle Database Docker Information
You must subscribe on the docker hub to Oracle to be able to pull the image. 
- https://hub.docker.com/u/delamater/content/sub-ff8fca06-0633-47f3-856b-dad201e6db7b

#### Docker Pull 
- >docker pull store/oracle/database-enterprise:12.2.0.1

#### Oracle Connection Information
The default password to connect to the database with sys user is Oradoc_db1
Connect by SID (versus service name) and set the database to ORCLCDB in your connection properties


## Docker-Images git Repository
This repository is included as a submodule. To pull this submodule run the following git command: 
- >git submodule update --recursive

## Where To Clone This Docker Repository?
This repository should be cloned into your WSL image so or copied manually into your WSL image once you've successfully pulled all the submodules. 

### Docker Desktop Settings
- After you installed the WSL Ubuntu image of your choice be sure to enable WSL integration within this distro by opening the docker desktop settings, in the resources section go to WSL Integration. Enable the integration for the distro you chose. 
- Once WSL integration is achieved you can move files from your distro and back using \\wsl$ on Windows

### Example: Build Oracle Database SingleInstance container
1. Within your Ubuntu distro change directory to the /oracle/docker-images/OracleDatabase/SingleInstance/dockerfiles directory 
2.  . ./buildContainerImage.sh -e -v 19.3.0 >> mylog3.log
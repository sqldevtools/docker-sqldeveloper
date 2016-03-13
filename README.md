# docker-sqldeveloper
Docker Container for running Oracle SQL Developer

### Installation

create a directory /src next to the Dockerfile with these 2 files
```
jdk-8u73-linux-x64.rpm
sqldeveloper-4.1.3.20.78-1.noarch.rpm
```
you can download the files from
- http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
- http://www.oracle.com/technetwork/developer-tools/sql-developer

build the container:
```
docker build -t sqldeveloper .
```

### Execution

to start SQL Developer using your local X-Server use the script
```
./run.sh
```

# mlflow Demonstrations

This repo demonstrates the use of [mlflow](https://github.com/mlflow/mlflow).  Docker containers
provide the run-time environment for this demonstration.

## Demonstration Environment
![](images/demo_environment_architecture.png)


## System Requirements
* Docker
* Docker Compose

Work performed with Docker for Mac Version 2.0.0.3 (31259)


## Initial Setup
* clone repo to local computer
* Navigate to `./run_demo`
* Run the following commands.  These commands are required 
to initially build or rebuild the required Docker images.
```
(cd python_image && bash build_image)
(cd mlflow_r_image && bash build_image)
(cd mlflow_server && bash build_image)
```
Note:  On a MacbookPro with 16GB RAM, it took about 14 minutes for the initial 
build of the three images.


## Start demonstration containers
Navigate to ./run_demo
* To bring up the three containers:
```
docker-compose up --detach
```
* To stop the three containers:
```
docker-compose down
```

## Connecting to containers
* Python Container:  `http://0.0.0.0:8888`
* R Container: `http://0.0.0.0:8787`
* mlflow tracking server: `http://0.0.0.0:5000`
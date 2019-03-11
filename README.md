# mlflow Demonstrations

This repo demonstrates the use of [mlflow](https://github.com/mlflow/mlflow).  Docker containers
provide the run-time environment for this demonstration.

## Demonstration Environment
![](images/demo_environment_architecture.png)


## System Requirements
* Docker
* Docker Compose




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
Note:  On a MacbookPro with 16GB RAM, it took about 14 minutes to 
build the three images.


## Start demonstration containers
* Navigate to ./run_demo
* To bring up the three containers:
```
docker-compose up
```
* To stop the three containers:
```
docker-compose down
```

d
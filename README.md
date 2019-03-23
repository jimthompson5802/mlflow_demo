# mlflow Demonstration

This repo demonstrates the use of the open source project [mlflow](https://mlflow.org), which is used to record 
and manage results of machine learning experiments.  Docker containers
provide the run-time environment for this demonstration.

Code used in this demonstration is based on these mflow examples: 
[`examples/sklearn_elasticnet_wine`](https://github.com/mlflow/mlflow/tree/master/examples/sklearn_elasticnet_wine) 
and [`examples/r_wine`](https://github.com/mlflow/mlflow/tree/master/examples/r_wine)

## Demonstration Environment
![](images/demo_environment_architecture.png)


## System Requirements
* [Docker](https://docs.docker.com/develop/)
* [Docker Compose](https://docs.docker.com/compose/overview/)

Work performed with Docker for Mac Version 2.0.0.3 (31259)


## Initial Setup
* Clone repo to local computer.  Note directory for the local repo, e.g., `/home/userid/mlflow_demo`
* Create directory to hold mlflow server tracking data and artifacts, e.g., `/home/userid/mlflow_server`.  Within this  
directory create two subdirectories called `tracking` and `artifacts`
```
/home/userid/mlflow_server/tracking
/home/userid/mlflow_server/artifacts
```
* Change working directory to `run_demo`
* Update contents of `./setup_environment_variables` to specify values for the required environment variables.
```
MLFLOW_VERSION
MLFLOW_VERSION_TO_INSTALL
MFLOW_DEMO_DIRECTORY
MLFLOW_TRACKING_DIRECTORY
```
 
Specify version of mlflow package.  See example below.
```
###
# Set up environment variables to control building and
# running demonstration mlflow Docker containers
###

# mlflow version to install
export MLFLOW_VERSION=0.9.0

# directory containing demonstration source code
export MLFLOW_DEMO_DIRECTORY=/path/to/directory/for/local/repo

# directory to hold mlflow tracking and artifacts
export MLFLOW_TRACKING_DIRECTORY=/path/to/directory/for/tracking-artifacts

###
# EXAMPLES
# MLFLOW_VERSION_TO_INSTALL="mlflow"    Current version in PyPi
# MLFLOW_VERSION_TO_INSTALL="mlflow==${MLFLOW_VERSION}"   Specific version from PyPi
# MLFLOW_VERSION_TO_INSTALL="git+https://github.com/mlflow/mlflow.git@vx.y.z#egg=mlflow"  specific version from github
###
# version of mlflow to install in containers
#export MLFLOW_VERSION_TO_INSTALL="mlflow==${MLFLOW_VERSION}"
export MLFLOW_VERSION_TO_INSTALL="git+https://github.com/mlflow/mlflow.git@v${MLFLOW_VERSION}#egg=mlflow"  specific version from github

```
* After updating `setup_environment_variables`, execute following command to set  
environment variables: `. ./setup_environment_variables`

* Run the following command to initially build the required Docker images.
```
bash ./build_images
```
Note:  On a MacbookPro with 16GB RAM, it took about 13 minutes for the initial 
build of the three images.


## Start demonstration containers
After building the three Docker images, navigate to `./run_demo`.   Ensure the required
environment variables are defined by running `. ./setup_environment_variables`.
* To bring up the three containers:
```
docker-compose up --detach
```
* To stop the three containers:
```
docker-compose down
```

## Connecting to containers
Open a browser and enter the following URL for the respective service.
* Python Container:  `http://0.0.0.0:8888`
* R Container: `http://0.0.0.0:8787`
* mlflow tracking server: `http://0.0.0.0:5000`

## mlflow Demonstration Dashboard

### Experiment Summary
![](images/dashboard_experiment_view.png)

### Run Summary
![](images/dashboard_run_view.png)
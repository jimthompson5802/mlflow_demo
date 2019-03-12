FROM continuumio/anaconda3:5.3.0

ARG MLFLOW_VERSION

RUN echo "\n###\n# BUILDING mlflow_python image with mlflow ${MLFLOW_VERSION}\n###"

#
#  install xgboost 
#
#  https://anaconda.org/conda-forge/xgboost
#
RUN conda install -c conda-forge xgboost


# 
# install mlflow
#
RUN pip install mlflow==${MLFLOW_VERSION}

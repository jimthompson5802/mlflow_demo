FROM continuumio/miniconda

ARG MLFLOW_VERSION

RUN echo "\n###\n# BUILDING mlflow_server image with mlflow ${MLFLOW_VERSION}\n###"

RUN pip install ${MLFLOW_VERSION}

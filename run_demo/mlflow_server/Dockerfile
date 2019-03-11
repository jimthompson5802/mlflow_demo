FROM continuumio/miniconda

ARG MLFLOW_VERSION

RUN echo BUILDING FOR mlflow ${MLFLOW_VERSION}

RUN pip install mlflow==${MLFLOW_VERSION}

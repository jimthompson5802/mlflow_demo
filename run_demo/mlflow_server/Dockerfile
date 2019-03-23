FROM continuumio/miniconda

ARG MLFLOW_VERSION

RUN echo "\n###\n# BUILDING mlflow_server image with mlflow ${MLFLOW_VERSION}\n###"

WORKDIR /app

RUN curl -L https://github.com/mlflow/mlflow/archive/v${MLFLOW_VERSION}.tar.gz | \
      tar xzfv - --strip 1  && \
    pip install -e . && \
    apt-get update && apt-get install -y gnupg && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && apt-get install -y nodejs && \
    cd mlflow/server/js && \
    npm install && \
    npm run build

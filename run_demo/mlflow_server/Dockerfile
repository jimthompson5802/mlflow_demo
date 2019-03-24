FROM continuumio/miniconda

ARG MLFLOW_VERSION
ARG MLFLOW_VERSION_TO_INSTALL

RUN echo "\n###\n# BUILDING mlflow_server image with mlflow ${MLFLOW_VERSION}\n###"

###
# uncomment this section if mlflow version is avaialble on pypy.org install
#
#RUN pip install ${MLFLOW_VERSION_TO_INSTALL}




###
# Uncomment this section if install is from github because pypy version not available
###
WORKDIR /app

RUN curl -L https://github.com/mlflow/mlflow/archive/v${MLFLOW_VERSION}.tar.gz | \
      tar xzfv - --strip 1  && \
    pip install -e . && \
    pip install sqlalchemy psycopg2 && \
    apt-get update && apt-get install -y gnupg && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && apt-get install -y nodejs && \
    cd mlflow/server/js && \
    npm install && \
    npm run build

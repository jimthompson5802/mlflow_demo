FROM rocker/rstudio-stable:latest

ARG MLFLOW_VERSION

RUN echo BUILDING FOR mlflow ${MLFLOW_VERSION}

# install miniconda and prereq libraries
RUN apt-get update && \
    apt-get install -y zlib1g-dev libxml2-dev bzip2 && \
    wget -nv https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
       -O /tmp/miniconda.sh  && \
    bash /tmp/miniconda.sh -b -p /opt/conda 

# set up path to conda binary
ENV PATH /opt/conda/bin:$PATH

# install R prereq packages and R mlflow support
RUN mkdir ~/.R &&\
    echo 'MAKEFLAGS = -j6' >~/.R/Makevars && \
    Rscript -e "install.packages(c('devtools','glmnet','rmarkdown','caTools','bitops'), Ncpus=3)"  \
      -e "library(devtools)" \
      -e "devtools::install_github('mlflow/mlflow/mlflow/R/mlflow@v${MLFLOW_VERSION}', threads=4)" \
      -e "Sys.setenv(PATH = paste('/opt/conda/bin',Sys.getenv('PATH'), sep=':'))"  \
      -e "mlflow::mlflow_install()"

# work-around for inability to specify mlflow version in mlflow::mlflow_install()
RUN /bin/bash -c ". activate r-mlflow && pip uninstall --yes mlflow && pip install mlflow==${MLFLOW_VERSION}"


# create link to user source code
RUN cd /home/rstudio && \
    ln -s /opt/project project && \
    echo  '\nexport PATH=/opt/conda/bin:$PATH' >>./.bashrc && \
    echo 'Sys.setenv(PATH=paste("/opt/conda/bin",Sys.getenv("PATH"),sep=":"))' >>./.Rprofile


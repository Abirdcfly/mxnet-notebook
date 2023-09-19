FROM python:3.10-slim

# Set bash as the default shell
ENV SHELL=/bin/bash

# Create a working directory
WORKDIR /app/

RUN apt-get -y update \
 && apt-get -y install libgomp1 \
    libquadmath0 \ 
    apt-utils \
    vim \
    git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# alias python='python3'
# RUN ln -s /usr/bin/python3 /usr/bin/python

# https://raw.githubusercontent.com/kubeflow/katib/v0.16.0-rc.1/examples/v1beta1/trial-images/mxnet-mnist/requirements.txt%
RUN pip install --prefer-binary \
   mxnet==1.9.1 \
   numpy==1.23.5 \
   jupyterlab -i https://mirrors.aliyun.com/pypi/simple/ && rm -rvf ~/.cache

# start jupyter lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
EXPOSE 8888

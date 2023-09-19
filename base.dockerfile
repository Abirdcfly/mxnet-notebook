FROM nvcr.io/nvidia/mxnet:22.11-py3

# Set bash as the default shell
ENV SHELL=/bin/bash

# Create a working directory
WORKDIR /app/

# Build with some basic utilities
RUN apt-get update && apt-get install -y \
    apt-utils \
    vim \
    git

# alias python='python3'
# RUN ln -s /usr/bin/python3 /usr/bin/python

# build with some basic python packages
RUN pip install \
    jupyterlab -i https://mirrors.aliyun.com/pypi/simple/ && rm -rvf ~/.cache

# start jupyter lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
EXPOSE 8888

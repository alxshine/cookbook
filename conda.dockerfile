FROM ubuntu:20.04

# install conda (taken from conda/miniconda3 Dockerfile)
RUN apt-get -qq update && apt-get -qq -y install bzip2 curl \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    # && apt-get -qq -y remove curl bzip2 \
    # && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

# by creating a dev user I can directly use this image in devcontainers
RUN adduser --disabled-password --gecos "" --no-create-home dev

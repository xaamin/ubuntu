FROM ubuntu:22.04
MAINTAINER Benjamín Martínez Mateos <xaamin@outlook.com>

# Install requeriments
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        --no-install-recommends \
        gpg-agent \
        net-tools \
        iputils-ping \
        tzdata \
        iproute2 \
        dnsutils \
        apt-utils \
        build-essential \
        software-properties-common \
        bash-completion \
        curl \
        git \
        htop \
        man \
        zip \
        unzip \
        vim \
        wget \
        supervisor \
    # Remove temp files
    && apt-get clean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add additional files
ADD root/scripts /root/scripts

# Set environment variables
ENV HOME /root

# Set working directory
WORKDIR /root

# Default command
CMD ["/bin/bash"]
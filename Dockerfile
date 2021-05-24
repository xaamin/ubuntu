FROM ubuntu:18.04
MAINTAINER Benjamín Martínez Mateos <xaamin@outlook.com>

# Install requeriments
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y update \
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
        byobu \
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
        openssh-server \
    # Remove temp files
    && apt-get clean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && useradd -m xaamin

# Add additional files
ADD root/.gitconfig /root/.gitconfig
ADD root/scripts /root/scripts

# Set environment variables
ENV HOME /root

# Set working directory
WORKDIR /root

# Expose SSH
EXPOSE 22

# Default command
CMD ["/bin/bash"]
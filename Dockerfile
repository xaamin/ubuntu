FROM ubuntu:16.04
MAINTAINER Benjamín Martínez Mateos <xaamin@outlook.com>

# Enable multiverse
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list

# Installing the 'apt-utils' package gets rid of the 
# 'debconf: delaying package configuration, since apt-utils is not installed'
# error message when installing any other package with the apt-get package manager.

RUN apt-get -y update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		--no-install-recommends \
		apt-utils 

# Upgrade OS
RUN apt-get -y upgrade \
	&& rm -rf /var/lib/apt/lists/*

# Install requeriments
RUN apt-get -y update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		--no-install-recommends \
		build-essential \
		software-properties-common \
		byobu \
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
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Add bootstrap file
ADD root/sources.sh /root/sources.sh

# Set environment variables
ENV HOME /root

# Set working directory
WORKDIR /root

# Add sources to bashrc
RUN /bin/bash  /root/sources.sh

# Default command
CMD ["/bin/bash"]
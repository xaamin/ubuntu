FROM ubuntu:16.04
MAINTAINER Benjamín Martínez Mateos <xaamin@outlook.com>

# Install requeriments
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list \
	&& apt-get -y update \
	&& apt-get -y upgrade \	
	&& apt-get -y update \
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

# Set environment variables
ENV HOME /root

# Set working directory
WORKDIR /root

# Add sources to bashrc
RUN /bin/bash  /root/.scripts/start.sh

# Default command
CMD ["/bin/bash"]
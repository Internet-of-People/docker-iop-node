FROM ubuntu:16.04
MAINTAINER Lucas Pantanella

# Skip "apt-get install" interactive prompts during build
ARG DEBIAN_FRONTEND=noninteractive
# Disable setting kernel parameters
ARG ES_SKIP_SET_KERNEL_PARAMETERS=true

RUN \
# Base install
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y wget && \
# Install IoP blockchain wallet
  wget https://github.com/Internet-of-People/iop-blockchain/releases/download/v5.0.0/iop-blockchain_5.0.0-ubuntu1604_amd64.deb && \
  dpkg -i iop-blockchain_5.0.0-ubuntu1604_amd64.deb || apt-get -fy install

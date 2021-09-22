FROM ubuntu:21.10

LABEL maintainer="Philip Schmid (@PhilipSchmid)"

LABEL name="pschmid/tshoot"
LABEL version="v0.0.1"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Zurich

RUN apt update && apt upgrade -y && apt install -y \
    tzdata \
    tcpdump \
    htop \
    nmap \
    net-tools \
    curl \
    wget \
    vim \
    iperf3 \
    dnsutils \
    iproute2 \
    iputils-ping \
    isc-dhcp-client \
    traceroute \
    netcat \
    bpfcc-tools \
    iotop \
    nfs-common \
  && rm -rf /var/lib/apt/lists/*
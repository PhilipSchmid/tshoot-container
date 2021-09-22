FROM ubuntu:21.10

LABEL org.opencontainers.image.authors="Philip Schmid (@PhilipSchmid)"
LABEL org.opencontainers.image.version="0.0.1"
LABEL org.opencontainers.image.source="https://github.com/PhilipSchmid/tshoot-container"
LABEL org.opencontainers.image.base.name="docker.io/library/ubuntu:21.10"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt update && apt install -y \
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
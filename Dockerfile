FROM ubuntu:21.10

LABEL org.opencontainers.image.authors="Philip Schmid (@PhilipSchmid)"
LABEL org.opencontainers.image.version="0.0.3"
LABEL org.opencontainers.image.source="https://github.com/PhilipSchmid/tshoot-container"
LABEL org.opencontainers.image.base.name="docker.io/library/ubuntu:21.10"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN rm -f /etc/apt/apt.conf.d/docker-clean
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
    bpftrace \
    iotop \
    nfs-common \
    fio \
    rsync \
    zip \
  && apt clean all \
  && rm -rf /var/lib/apt/lists/*

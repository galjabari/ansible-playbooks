# Use official Ubuntu base image
FROM ubuntu:latest

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        iproute2 \
        iputils-ping \
        net-tools \
        dnsutils \
        wget \
        curl \
        traceroute \
        nano \
        vim \
        sudo \
        gnupg \
        lsb-release \
        python3 \
        python3-pip \
        tcpdump \
        iptables \
        bridge-utils \
        ca-certificates \
        openssh-server \
        isc-dhcp-client \
    && rm -rf /var/lib/apt/lists/*

# Create a 'clab' user with sudo privileges and 'clab' password"
RUN useradd -ms /bin/bash clab && echo "clab:clab" | chpasswd && adduser clab sudo

# Set up SSH server
RUN mkdir -p /var/run/sshd && \
    touch /etc/ssh/sshd_config && \
    echo 'PermitRootLogin no' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Set working directory
WORKDIR /home/clab

# Set default command to start SSH server
CMD ["/usr/sbin/sshd", "-D"]

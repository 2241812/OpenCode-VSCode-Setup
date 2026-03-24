FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    git \
    openssh-client \
    sudo \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash devuser && \
    echo "devuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/devuser && \
    chmod 0440 /etc/sudoers.d/devuser

USER devuser
WORKDIR /home/devuser

RUN mkdir -p /home/devuser/.config/opencode \
    && mkdir -p /home/devuser/.local/share/opencode \
    && mkdir -p /home/devuser/.ssh \
    && mkdir -p /home/devuser/.git-templates

RUN curl -fsSL https://opencode.ai/install | bash

ENV PATH="/home/devuser/.opencode/bin:/home/devuser/bin:${PATH}"

WORKDIR /workspace

ENTRYPOINT ["opencode"]

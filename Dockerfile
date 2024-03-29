FROM ubuntu:focal AS base

WORKDIR /usr/local/bin

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential sudo && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS prime

ARG TAGS
RUN adduser --disabled-password --gecos '' moritz
RUN adduser moritz sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER moritz
ENV USER=moritz
WORKDIR /home/moritz

FROM prime
COPY --chown=moritz . .
RUN chmod u+rw -R /home/moritz/.ssh
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

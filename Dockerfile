FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install ansible wget unzip python3-pip -y && \
    wget https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_linux_amd64.zip -P /tmp && \
    unzip /tmp/terraform_1.5.4_linux_amd64.zip -d /usr/bin && \
    pip install google-auth &&\
    ansible-galaxy collection install google.cloud &&\
    apt-get install jq -y
RUN mkdir -p ~/.ssh && \
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""

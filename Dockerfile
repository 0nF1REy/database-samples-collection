FROM ubuntu:20.04

ARG GIT_USERNAME
ARG GIT_EMAIL

RUN apt-get update && apt-get install -y \
    git \
    curl \
    mysql-client \
    && rm -rf /var/lib/apt/lists/*  # Limpa arquivos temporários após a instalação

RUN git config --global --add safe.directory /usr/src/app && \
    git config --global user.name "${GIT_USERNAME}" && \
    git config --global user.email "${GIT_EMAIL}"

WORKDIR /usr/src/app

COPY . .

CMD ["tail", "-f", "/dev/null"]

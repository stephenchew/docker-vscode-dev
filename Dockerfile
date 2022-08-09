FROM bitnami/minideb:bullseye

ARG UID=1000
ARG GID=1000
ARG PASSWORD=12345
ARG GIT_EMAIL=youremail@github.com
ARG GIT_NAME=GithubName

RUN install_packages apt-utils sudo git curl ssh ca-certificates vim-tiny iputils-ping dnsutils gettext-base sshpass rsync \
        && addgroup --gid $GID dev \
        && useradd --create-home --home-dir /home/dev --shell /bin/bash --gid dev --groups sudo --uid $UID dev \
        && echo "dev:${PASSWORD}" | chpasswd \
        && echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
        && mkdir /home/dev/.ssh \
        && chown -R $UID:$GID /home/dev

RUN ssh-keygen -A

USER dev
WORKDIR /home/dev

COPY ["entrypoint.sh", "."]
RUN sudo chmod +x entrypoint.sh

COPY [".ssh/*", ".ssh/"]
RUN sudo chown dev:dev -R .ssh

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

RUN git config --global user.email "$GIT_EMAIL" && git config --global user.name "$GIT_NAME"

COPY [".bash_aliases", ".bash_aliases"]

# Alternatively, curl from "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
COPY ["git-prompt.sh", "git-prompt.sh"]
COPY [".bashrc_extra", ".bashrc_extra"]
RUN cat .bashrc_extra >> .bashrc
RUN rm .bashrc_extra

EXPOSE 22

ENTRYPOINT /home/dev/entrypoint.sh


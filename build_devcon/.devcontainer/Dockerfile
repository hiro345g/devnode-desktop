FROM mcr.microsoft.com/devcontainers/typescript-node:20-bookworm

COPY ./menu /home/node/.fluxbox/menu
COPY ./startup /home/node/.fluxbox/startup
COPY ./node.dot.bashrc /home/node/.bashrc
COPY ./node.dot.npmrc /home/node/.npmrc

RUN apt-get update && apt-get -y upgrade \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install task-japanese fonts-vlgothic \
        ibus bash-completion \
        firefox-esr-l10n-ja chromium chromium-l10n \
        iproute2 iputils-ping dnsutils \
    && sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen \
    && locale-gen \
    && rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && mkdir -p /home/node/workspace /home/node/.vscode-server/extensions \
    && cp -r /usr/local/share/npm-global/ /home/node/workspace/.npm-global \
    && chown -R node:node /home/node/workspace /home/node/workspace/.npm-global \
            /home/node/.vscode-server /home/node/.fluxbox /home/node/.bashrc

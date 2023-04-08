#!/bin/sh
REPO_DIR=$(cd $(dirname $0)/../dev;pwd)

if [ ! -e ${REPO_DIR}/devnode-desktop ]; then
  cd ${REPO_DIR}/
  wget https://github.com/hiro345g/devnode-desktop/archive/refs/heads/main.zip
  unzip main.zip
  mv devnode-desktop-main ${REPO_DIR}/devnode-desktop
  rm main.zip
fi
cd ${REPO_DIR}/..
mkdir devnode-desktop-mozc
cp -r ${REPO_DIR}/.devcontainer devnode-desktop-mozc/
cp -r ${REPO_DIR}/docker-compose.yml devnode-desktop-mozc/
if [ -e ${REPO_DIR}/.env ]; then cp ${REPO_DIR}/.env devnode-desktop-mozc/; fi
mkdir devnode-desktop-mozc/workspace_share
sed -i 's/devnode-desktop/devnode-desktop-mozc/' devnode-desktop-mozc/.devcontainer/devcontainer.json
sed -i 's/devnode-desktop/devnode-desktop-mozc/' devnode-desktop-mozc/docker-compose.yml

rm -fr devnode-desktop-main ${REPO_DIR}/devnode-desktop

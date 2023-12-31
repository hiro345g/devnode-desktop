#!/bin/sh
VERSION=1.3
BASE_DIR=$(cd $(dirname $0)/..;pwd)
REPO_DIR=$(cd $(dirname $0)/../..;pwd)
REPO_NAME=$(basename ${REPO_DIR})
DEV_DIR=${BASE_DIR}/dev
DST_DIR=${BASE_DIR}/${REPO_NAME}-mozc

if [ ! -e ${DEV_DIR}/${REPO_NAME} ]; then
  cd ${DEV_DIR}/
  wget https://github.com/hiro345g/${REPO_NAME}/archive/refs/heads/${VERSION}.zip
  unzip ${DEV_DIR}/${VERSION}.zip
  mv ${DEV_DIR}/${REPO_NAME}-${VERSION} ${DEV_DIR}/${REPO_NAME}
  rm ${DEV_DIR}/${VERSION}.zip
fi

if [ ! -e ${DST_DIR}/.devcontainer ]; then mkdir -p ${DST_DIR}/.devcontainer; fi
if [ ! -e ${DST_DIR}/workspace_share ]; then mkdir -p ${DST_DIR}/workspace_share; fi
cp -r ${DEV_DIR}/${REPO_NAME}/.devcontainer/* ${DST_DIR}/.devcontainer/
cp -r ${DEV_DIR}/${REPO_NAME}/docker-compose.yml ${DST_DIR}/
sed -i "s/${REPO_NAME}/${REPO_NAME}-mozc/" ${DST_DIR}/.devcontainer/devcontainer.json
sed -i "s/${REPO_NAME}/${REPO_NAME}-mozc/" ${DST_DIR}/docker-compose.yml

rm -fr ${DEV_DIR}/${REPO_NAME}

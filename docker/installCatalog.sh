#!/bin/bash
set -ex

git clone https://github.com/apache/incubator-openwhisk.git
git clone https://github.com/apache/incubator-openwhisk-package-alarms.git
git clone https://github.com/apache/incubator-openwhisk-catalog.git

pushd /incubator-openwhisk
  export OPENWHISK_HOME=$(pwd)
  curl https://openwhisk.ng.bluemix.net/cli/go/download/linux/amd64/wsk -o ./bin/wsk
  chmod +x ./bin/wsk
popd

pushd /incubator-openwhisk-catalog
  ./packages/installCatalog.sh $AUTH $APIHOST_URL $OPENWHISK_HOME/bin/wsk
popd

pushd /incubator-openwhisk-package-alarms
  ./installCatalog.sh $AUTH $APIHOST_URL $DB_URL $DB_PREFIX $APIHOST
popd

echo "successfully setup alarm package andalarm package and system catalog"


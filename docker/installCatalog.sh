#!/bin/bash
set -ex

pushd /incubator-openwhisk
  export OPENWHISK_HOME=$(pwd)
popd

pushd /incubator-openwhisk-catalog
  ./packages/installCatalog.sh $AUTH $APIHOST_URL $OPENWHISK_HOME/bin/wsk
popd

pushd /incubator-openwhisk-package-alarms
  ./installCatalog.sh $AUTH $APIHOST_URL $DB_URL $DB_PREFIX $APIHOST
popd

echo "successfully setup alarm package andalarm package and system catalog"


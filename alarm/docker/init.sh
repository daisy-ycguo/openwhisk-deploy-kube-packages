#!/bin/bash
set -x

git clone https://github.com/daisy-ycguo/incubator-openwhisk-package-alarms.git

# TODO: installCatalog.sh wants OPENWHISK_HOME set, but doesn't actually need
# it for anything.  Fix upstream and then remove this.
export OPENWHISK_HOME=/openwhisk
mkdir -p $OPENWHISK_HOME/bin

# Download and install openwhisk cli
pushd $OPENWHISK_HOME/bin
  wget -q https://github.com/apache/incubator-openwhisk-cli/releases/download/latest/OpenWhisk_CLI-latest-linux-amd64.tgz
  tar xzf OpenWhisk_CLI-latest-linux-amd64.tgz
popd

pushd /incubator-openwhisk-package-alarms
  ./installCatalog.sh $AUTH $APIHOST_URL $DB_URL $DB_PREFIX $APIHOST
popd

echo "successfully setup alarm package"


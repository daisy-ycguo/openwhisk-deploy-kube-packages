# openwhisk-deploy-kube-packages

This project is to deploy packages to OpenWhisk on a K8s using kubectl.

## Install alarm provider

Config the environment with correct values in yml file, and then
```
kubectl apply -f alarmprovider.yml
```
### Mandatory Environment Variables
|Name|Type|Description|
|---|---|---|
|DB_PROTOCOL|URL|The protocol for a persistent storage (either CouchDB or Cloudant)|
|DB_HOST|String|Host and port for your DB |
|DB_USERNAME|String|Username for your DB credentials|
|DB_PASSWORD|String|Password for your DB credentials|
|ROUTER_HOST|String|IP address of your OpenWhisk host|
|ENDPOINT_AUTH|String|The OpenWhisk auth key to use when installing the actions. Typically this would be the auth key for `whisk.system`|

### Install catalog package and alarm package
Config the environment variables with correct values in yml file, and then
```
kubectl apply -f packageinstaller.yml
```
### Mandatory Environment Variables
|Name|Type|Description|
|---|---|---|
|APIHOST_URL|URL|IP address of your OpenWhisk host|
|DB_URL|URL|The connection url for your DB |
|DB_PREFIX|String|The db prefix for your alarm package|
|APIHOST|String|IP address of your OpenWhisk host|
|AUTH|String|The OpenWhisk auth key to use when installing the actions. Typically this would be the auth key for `whisk.system`|

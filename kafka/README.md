# Deploy kafka package to Apache OpenWhisk

This project is to deploy kafka package to local Apache OpenWhisk on a K8s using YAML file.

## Step 1. Install kafka provider
Config the environment with correct values in yml file, and then
```
kubectl apply -f kafkaprovider.yml
```
### Mandatory Environment Variables
|Name|Type|Description|
|---|---|---|
|DB_URL|URL|The url for a persistent storage (either CouchDB or Cloudant)|
|DB_USER|String|Username for your DB credentials|
|DB_PASS|String|Password for your DB credentials|
|DB_PREFIX|String|Prefix for your kafka DB prefix|
|LOCAL_DEV|String|Must be true if you deploy on your own openwhisk|
|ROUTER_HOST|String|IP address of your OpenWhisk host. No usage for now, reserved for future use. |
|ENDPOINT_AUTH|String|The OpenWhisk auth key to use when installing the actions. Typically this would be the auth key for `whisk.system` No usage for now, reserved for future use|

## Step 2. Install messaging package
Config the environment variables with correct values in yml file. Make sure the APIHOST_URL, DB_URL, APIHOST are set to correct IP address. Then
```
kubectl apply -f kafkapkginstaller.yml
```

### Mandatory Environment Variables
|Name|Type|Description|
|---|---|---|
|APIHOST_URL|URL|IP address of your OpenWhisk host|
|DB_URL|URL|The connection url for your DB |
|DB_PREFIX|String|The db prefix for your alarm package|
|Q_DB_PREFIX|String|The db prefix for your kafka package. It must be same as DB_PREFIX configed in kafka provider. |
|APIHOST|String|IP address of your OpenWhisk host|
|AUTH|String|The OpenWhisk auth key to use when installing the actions. Typically this would be the auth key for `whisk.system`|

## Verify your Kafka package
Create a kafka package binding:
```
wsk package bind /whisk.system/messaging myKafkaPkg -p brokers "[\"kafka_host1:9093\", \"kafka_host2:9093\"]" -i
```
Create a trigger:
```
wsk trigger create MyKafkaTrigger -f myKafkaPkg/kafkaFeed -p topic in-topic -i
```
Send a message to kafka topic by invoking the action `kafkaProduce`:
```
wsk action invoke myKafkaPkg/kafkaProduce -p topic in-topic -p value "this is a message" -i
```
Check activation log to see `MyKafkaTrigger` is triggered when a new message is sent.
```
wsk activation poll -i
```

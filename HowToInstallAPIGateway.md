= How to install a complete API Gateway

When you are using api gateway in OpenWhisk, try this command:
```
wsk api list -i
```
If you get blow error, it means you didn't set up API Gatway completely.
```
$ ./wsk -i api list
error: Unable to obtain the API list: The requested resource does not exist. (code 128343)
```
Try below steps to install the artifacts on OpenWhisk which is used by API Gateway.

1. Clone the whole incubator-openwhisk in your disk:
```
git clone https://github.com/apache/incubator-openwhisk.git
```
Set environment OPENWHISK_HOME to this folder by:
```
export OPENWHISK_HOME=<your_incubator_openwhisk_folder>
```

2. Get the IP address and port of apigateway and redis, which will be used in the following steps by:
```
kubectl get svc -n openwhisk
```

3. Configure your apigateway to make sure apigateway can access redis (Need to verify if this step is nesseary).
Try below command, find `name: REDIS_HOST`, change the value from `redis.openwhisk` to the IP address of redis.
```
kubectl edit deployment apigateway -n openwhisk
```

4. Edit file `$OPENWHISK_HOME/ansible/roles/routemgmt/files/installRouteMgmt.sh`, change:
```
GW_USER=""
GW_PWD=""
GW_HOST_V2="http://10.0.0.116:9000/v2"
```
GW_HOST_V2 is the IP address and port of apigateway.

5. Run `$OPENWHISK_HOME/ansible/roles/routemgmt/files/installRouteMgmt.sh` by 
```
./installRouteMgmt.sh  <AUTH> <APIHOST> <NAMESPACE> <WSK_CLI> 
```
e.g.
```
./installRouteMgmt.sh 789c46b1-71f6-4ed5-8c54-816aa4f8c502:abczO3xZCLrMN6v2BKK1dXYFpXlPkccOFqm12CdAsMgRU4VrNZ9lyGVCGuMDGIwP  9.111.141.85:32437 /whisk.system /usr/local/bin/wsk
```

After that, you can try `wsk api list -i` and check if you API gateway is installed completely.

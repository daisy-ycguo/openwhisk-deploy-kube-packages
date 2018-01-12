wsk action delete messaging/messageHubProduce -i
wsk action delete messaging/kafkaProduce -i
wsk action delete messaging/messageHubFeed -i
wsk action delete messaging/kafkaFeed -i
wsk package delete messaging -i

wsk action delete messagingWeb/kafkaFeedWeb -i
wsk action delete messagingWeb/messageHubFeedWeb -i
wsk package delete messagingWeb -i

kubectl delete -f kafkaprovider.yml

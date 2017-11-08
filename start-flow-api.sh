#!/usr/bin/env bash

echo "###########环境变量说明###########"
echo "FLOW_API_DOMAIN: 部署的FlowApi地址, 默认是 http://localhost:8080"
echo "FLOW_WEB_DOMAIN: 部署的FlowWeb地址, 默认是 http://localhost:3000"
echo "FLOW_WS_URL: FlowApi websocket 地址, 默认是 ws://localhost:8080"
echo "FLOW_SYS_EMAIL: Flow 的系统账号， 默认是 admin@flow.ci"
echo "FLOW_SYS_USERNAME: Flow 的系统用户名， 默认是 admin"
echo "FLOW_SYS_PASSWORD: Flow 的系统密码， 默认是 123456"

if [[ ! -n $FLOW_API_DOMAIN ]]; then
	export FLOW_API_DOMAIN=http://192.168.2.236:8080
fi

if [[ ! -n $FLOW_WEB_DOMAIN ]]; then
	export FLOW_WEB_DOMAIN=http://192.168.2.236:3000
fi

if [[ ! -n $FLOW_WS_URL ]]; then
	export FLOW_WS_URL=ws://192.168.2.236:8080
fi

if [[ ! -n $FLOW_SYS_EMAIL ]]; then
	export FLOW_SYS_EMAIL=admin@flow.ci
fi

if [[ ! -n $FLOW_SYS_USERNAME ]]; then
	export FLOW_SYS_USERNAME=admin
fi

if [[ ! -n $FLOW_SYS_PASSWORD ]]; then
	export FLOW_SYS_PASSWORD=123456
fi
 
MYSQL_USERNAME=root
MYSQL_PASSWORD=
MYSQL_HOST=192.168.2.236

docker run -e FLOW_API_DOMAIN=$FLOW_API_DOMAIN \
		   -e FLOW_WEB_DOMAIN=$FLOW_WEB_DOMAIN \
		   -e FLOW_WS_URL=$FLOW_WS_URL \
		   -e FLOW_SYS_USERNAME=$FLOW_SYS_USERNAME \
		   -e FLOW_SYS_EMAIL=$FLOW_SYS_EMAIL \
		   -e FLOW_SYS_PASSWORD=$FLOW_SYS_PASSWORD \
		   -e MYSQL_USERNAME=$MYSQL_USERNAME \
		   -e MYSQL_PASSWORD=$MYSQL_PASSWORD \
		   -e MYSQL_HOST=$MYSQL_HOST \
		   -p '8080:8080' \
		   -p '2181:2181' \
		   -v /Users/firim/workspace/flow-pf/docker:/etc/flow.ci/config \
		   flowci/flow.ci.backend 

export HOST_IP_ADDRESS=`ip route get 8.8.8.8 | awk '{print $NF; exit}'`
export XMPP_DOMAIN=xmppbroker.localdev.iottly.org
export XMPP_USERNAME=iottlycore
export XMPP_PASSWORD_ENC=0a7581473c8979a9798b339b77817129e6b29fdb87cecd240e16e1ae666d7464
export XMPP_MGMT_REST_SECRET=EKdj6y0USG4tP4Ki
export IOTTLY_MQTT_TOPIC_COMMANDS=/iottly/management/+/+/commands

docker-compose up -d
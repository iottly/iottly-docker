export API_HOSTNAME=demoapi.iottly.org
export XMPP_BROKER_HOSTNAME}=demobroker.iottly.org
export MQTT_BROKER_HOSTNAME}=mqttdemobroker.iottly.org
export XMPP_MGMT_REST_SECRET=secret
export XMPP_PASSWORD=secret
export XMPP_DOMAIN=xmpphost
export XMPP_USERNAME=xmppuser
export XMPP_PASSWORD_ENC=enc_secret
export IOTTLY_MQTT_TOPIC_COMMANDS=/iottly/management/+/+/commands

docker-compose -f docker-compose.yml up -d
export API_HOSTNAME=demoapi.iottly.org
export BROKER_HOSTNAME=demobroker.iottly.org
export XMPP_MGMT_REST_SECRET=secret
export XMPP_PASSWORD=secret
export XMPP_DOMAIN=xmpphost
export XMPP_USER=xmppuser

docker-compose -f docker-compose.yml up -d
export API_HOSTNAME=demoapi.iottly.org
export BROKER_HOSTNAME=demobroker.iottly.org
export XMPP_MGMT_REST_SECRET=secret
export XMPP_PASSWORD=secret
export XMPP_DOMAIN=xmpphost
export XMPP_USERNAME=xmppuser
export XMPP_PASSWORD_ENC=enc_secret

docker-compose -f docker-compose.yml up -d
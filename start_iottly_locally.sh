export HOST_IP_ADDRESS=`ip route get 8.8.8.8 | awk '{print $NF; exit}'`
export XMPP_DOMAIN=xmppbroker.localdev.iottly.org

docker-compose up -d
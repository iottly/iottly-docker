export HOST_IP_ADDRESS=`ip route get 8.8.8.8 | awk '{print $NF; exit}'`
docker-compose up -d
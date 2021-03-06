# License

Copyright 2015 Stefano Terna

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# iottly-docker
The iottly-docker repo defines and maintains the Iottly stack architecture and makes it easy to run the full environment in both production and development.

# How to setup Iottly locally

Iottly runs on Linux / Docker.

## Docker:
- install Docker (> 1.10.2): http://docs.docker.com/engine/installation/
- install Docker Compose (> 1.6.0): https://docs.docker.com/compose/install/

## Clone Iottly repos:
- `mkdir iottly`
- `cd iottly`
- clone each Iottly repo
- eventually with [this script](https://raw.githubusercontent.com/iottly/iottly-docker/master/gitclone.sh)

## Prepare iottly-console
- see [after a fresh clone](https://github.com/iottly/iottly-console#after-a-fresh-clone) in iottly-console repo.

## Start the full Iottly stack:
- `cd iottly-docker`
- `./start_iottly_locally.sh`
- this will:
  - set the env var `HOST_IP_ADDRESS` with the IP address of your dev box 
    - the address is the one with which your box is connected to the local network (via eth or wlan)
    - this allows testing the dev env of Iottly with physical devices connected to your local network
    - if you are running Docker on non Linux OS maybe you need to set a bridge networking on the underlying VBox machine 
  - pull required images from Docker Hub
  - build each Iottly component as per specific Dockerfile in each repo
  - start each component

Containers communicate via 'iottlydocker' (local) network created by Docker Compose.

## How to access the services:

All services are exposed via [iottly-http-load-balancer](https://github.com/iottly/iottly-http-load-balancer):
- iottly web application (iottly-console):
  - http://127.0.0.1:8580/
- iottly-core API:
  - http://127.0.0.1:8550/v1.0/[service path]
- iottly-core web socket:
  - http://127.0.0.1:8560/v1.0
- iottly-xmpp-broker:
  - http://127.0.0.1:9090
- iottly-client-core and iottly-client-UI:
  - http://127.0.0.1:8521


## Start the development device:
- see [Iottly device agent documentation](https://github.com/iottly/iottly-device-agent-py)

# Development in docker environment

Iottly makes use of Docker Compose override feature to combine the following needs:
- production needs: source files have to be shipped within the container
- development needs: source files have to be shared among container and host

For this purpose production services are defined in the main [`docker-compose.yml`](https://github.com/iottly/iottly-docker/blob/master/docker-compose.yml) file, while development overrides are defined in the [`docker-compose.override.yml`](https://github.com/iottly/iottly-docker/blob/master/docker-compose.override.yml). Specifically the override file defines how the development host directories overlay the container directories. In this way a change in a source file is immediately available to the container after saving it.

# Useful docker (compose) commands to inspect what's going on

`cd iottly-docker`
(all docker compose commands should be run from within `iottly-docker` dir)

- to get the list of running of running services:
  - `docker-compose ps`
- to get logs of a running service (for example for iottlycore):
  - `docker-compose logs iottlycore`
- to execute a shell within a running container (for example for iottlycore):
  - `docker exec -i -t iottlydocker_iottlycore_1 bash`
  - note that you need to use the container name here, not the service name
- to inspect the /etc/hosts file in a running container (for example for xmppbroker):
  - `docker exec -i -t iottlydocker_xmppbroker_1 cat /etc/hosts`

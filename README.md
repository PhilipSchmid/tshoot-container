# Troubleshooting Container Image

[![Docker](https://github.com/PhilipSchmid/tshoot-container/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/PhilipSchmid/tshoot-container/actions/workflows/docker-publish.yml)

## Usage
```bash
sudo podman run --rm -it --privileged --ipc=host --pid=host --network=host \
  -e HOST=/host \
  -v /:/host \
  -v /run:/run \
  -v /var/log:/var/log:ro \
  -v /etc/localtime:/etc/localtime:ro \
  -v /lib/modules:/lib/modules:ro \
  -v /sys:/sys:ro \
  -v /usr/src:/usr/src:ro \
  ghcr.io/philipschmid/tshoot:latest
```
(Params depend on the tools you would like to use...)

# Troubleshooting Container Image

## Usage
```bash
sudo podman run --rm -it --privileged --ipc=host --net=host --pid=host --network=host \
  -v /run:/run \
  -v /var/log:/var/log:ro \
  -v /etc/localtime:/etc/localtime:ro \
  -v /lib/modules:/lib/modules:ro \
  -v /sys:/sys:ro \
  -v /usr/src:/usr/src:ro \
  ghcr.io/philipschmid/tshoot:v0.0.1
```
(Params depend on the tools you would like to use...)
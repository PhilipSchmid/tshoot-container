# Troubleshooting Container Image

[![Docker](https://github.com/PhilipSchmid/tshoot-container/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/PhilipSchmid/tshoot-container/actions/workflows/docker-publish.yml)

**Archived in favor of https://github.com/nicolaka/netshoot.**

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

```bash
kubectl run --rm -it --image ghcr.io/philipschmid/tshoot:latest tshoot -- /bin/bash
```

Example for `tcpdump` troubleshooting inside Kubernetes:
```bash
echo 'apiVersion: v1
kind: Pod
metadata:
  labels:
    run: tshoot
  name: tshoot
spec:
  dnsPolicy: ClusterFirstWithHostNet
  hostNetwork: true
  containers:
  - args:
    - "sleep"
    - "infinity"
    image: ghcr.io/philipschmid/tshoot:latest
    name: tshoot' | k apply -f-
k exec -it tshoot -- /bin/bash
```

## Examples
### High Load15 & high NFS IOPS
For example when the node has a high load15 but at the same time a low CPU usage. IOPS spike on the NFS storage backend. Find the process with the most NFS calls:
```
#!/usr/bin/bpftrace
BEGIN
{
        printf("Tracing nfs syscalls... Hit Ctrl-C to end.\n");
}

kprobe:nfs_file_write,
kprobe:nfs_file_read,
kprobe:nfs_file_flush,
kprobe:nfs_file_release,
kprobe:nfs_file_fsync,
kprobe:nfs_file_open,
kprobe:nfs_direct_IO,
kprobe:nfs_start_io_read,
kprobe:nfs_end_io_read,
kprobe:nfs_start_io_write,
kprobe:nfs_end_io_write,
kprobe:nfs_start_io_direct,
kprobe:nfs_end_io_direct,
kprobe:nfs_getattr
{
        @[pid, comm, func] = count();
}

interval:s:5
{
        time();
        print(@);
        clear(@);
}

END
{
        clear(@);
}
```

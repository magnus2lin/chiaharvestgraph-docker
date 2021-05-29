# chiaharvestgraph-docker
docker image for chiaharvestgraph

## Quick Start

```shell
docker build -t chiaharvestgraph https://github.com/FinalPoint/chiaharvestgraph-docker.git#main
docker run -it --rm -e TZ=Etc/UTC --mount type=bind,source=${HOME}/.chia/mainnet/log,target=/chia_log,readonly chiaharvestgraph
```

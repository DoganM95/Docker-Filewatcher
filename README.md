# Intro

This is a docker image to run a container that listens for filechanges inside the defined folder (bound as volume) and restarts a defined container automatically each time. It was built to make the app "Monitoror" reflect changes, whenever the `config.json` it reads changes, because monitoror itself requires to restart the container manually on each change. However, docker-filewatcher can be used universally.

# Setup

In general, the run command looks like this:

```shell
docker run -d \
    -e TARGET_CONTAINER=<name-of-container-to-watch> \
    --name=<name-of-this-container> \
    --pull=always \
    -v "<some-local-dir>:/watchdir" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    ghcr.io/doganm95/docker-filewatcher:latest
```

with the following placeholders:

- `<name-of-container-to-watch>`: The exact name of the container to take care of
- `<name-of-this-container>`: Any name this container should have
- `<some-local-dir>`: The directory to watch for changes in, checks all files inside

## Example

One example use case is setting this up for "Monitoror", so this container restarts the app, whenever the `config.json` changes

```shell
docker run -d \
    --pull=always \
    --name=monitoror-restarter \
    -e TARGET_CONTAINER=monitoror \
    -v "/home/Monitoror/config:/watchdir" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    ghcr.io/doganm95/docker-filewatcher:latest
```

FROM alpine:latest

# install stuff
RUN apk add --no-cache inotify-tools curl

# script to container
COPY watcher.sh /usr/local/bin/watcher.sh

# make script executable
RUN chmod +x /usr/local/bin/watcher.sh

# set entrypoint
ENTRYPOINT ["/usr/local/bin/watcher.sh"]
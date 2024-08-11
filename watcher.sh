#!/bin/sh

WATCHED_DIR="/watchdir"

echo "Watching directory $WATCHED_DIR for changes..."

# Watch all files in a dir
while inotifywait -r -e modify,create,delete,move "$WATCHED_DIR"; do
    echo "Change detected in $WATCHED_DIR, restarting $TARGET_CONTAINER..."
    docker restart "$TARGET_CONTAINER"
done
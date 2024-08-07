#!/bin/bash
PASSPHRASE=$(< /run/secrets/passphrase)

if [ -z "$RECEIVE_PORT" ]; then
  echo "Error: RECEIVE_PORT is not set."
  exit 1
fi

if [ -z "$SEND_PORT" ]; then
  echo "Error: SEND_PORT is not set."
  exit 1
fi

ffmpeg -i "srt://0.0.0.0:${RECEIVE_PORT}?mode=listener&passphrase=${PASSPHRASE}&pbkeylen=32" -fflags nobuffer -preset veryfast -tune zerolatency -vcodec copy -f mpegts "srt://0.0.0.0:${SEND_PORT}?mode=listener&passphrase=${PASSPHRASE}&pbkeylen=32"

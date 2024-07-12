#!/bin/bash
PASSPHRASE=$(< /run/secrets/passphrase)
/srt-1.5.3/_build/srt-live-transmit srt://:"$RECEIVE_PORT"?mode=listener&latency=100ms&passphrase=""&pbkeylen=32 srt://:"$SEND_PORT"?mode=listener&latency=100ms&passphrase="$PASSPHRASE"&pbkeylen=32
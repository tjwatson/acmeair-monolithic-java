#!/bin/bash 
set -e

# Pass on to the real server run
if [ -d "/opt/ol/wlp/usr/servers/defaultServer/workarea/checkpoint/image" ]; then
  # A checkpoint image found; exec dumb-init for signal handling.
  # Use of dumb-init for PID 1 is required for signal handling because
  # the restored server process cannot be PID 1.
  exec dumb-init --rewrite 15:2 -- /opt/ol/helpers/runtime/restore-server.sh "$@"
elif [[ ! -z "$WLP_CHECKPOINT" ]]; then
  # Unset WLP_CHECKPOINT so it is not set in the final image after checkpoint.
  TMP_CHECKPOINT=$WLP_CHECKPOINT
  unset WLP_CHECKPOINT
  # A checkpoint action has been requested; run the checkpoint.sh script.
  checkpoint.sh "$TMP_CHECKPOINT"
else
  # The default is to just exec the supplied CMD
  exec "$@"
fi

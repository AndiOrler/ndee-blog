#!/bin/bash
#set -euo pipefail

tail -f /dev/null &

# trap 'kill $(jobs -p)' EXIT
trap "exit" INT
trap "exit" TERM

wait
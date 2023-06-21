#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

echo '****** CREATE VM ******'
now=$(date +%s)sec
vagrant up
vagrant status
echo "how much time (HH:MM.SEC):" $(TZ=UTC date --date now-$now +%H:%M:%S.%N)
exit;
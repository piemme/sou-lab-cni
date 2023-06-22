#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

echo '****** PROVISION VM ******'
now=$(date +%s)sec
vagrant provision
echo "how much time:" $(TZ=UTC date --date now-$now +%H:%M:%S.%N)

exit;
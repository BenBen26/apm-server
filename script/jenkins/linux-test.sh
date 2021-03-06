#!/usr/bin/env bash
set -exuo pipefail

source ./_beats/dev-tools/common.bash

jenkins_setup

cleanup() {
  rm -rf $TEMP_PYTHON_ENV
  .ci/scripts/docker-get-logs.sh
  make stop-environment fix-permissions
}
trap cleanup EXIT

make update
make system-tests-environment

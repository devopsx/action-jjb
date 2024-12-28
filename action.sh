#!/bin/bash

set -xeu -o pipefail

if [[ "$INPUT_JENKINS_CERT" != 'false' ]]; then
  export REQUESTS_CA_BUNDLE="$INPUT_JENKINS_CERT"
fi

delete_old=""
if [[ "$INPUT_DELETE_OLD" != 'false' ]]; then
  delete_old="--delete-old"
fi

jenkins-jobs --conf "$INPUT_INI_FILE" -p "$INPUT_JENKINS_TOKEN" update -r "$INPUT_JOBS_DIR" $delete_old

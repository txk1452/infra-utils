#!/bin/bash
set -e

wget https://github.com/Sage-Bionetworks/infra-utils/archive/master.zip -O /tmp/infra-utils.zip
unzip -j -n /tmp/infra-utils.zip -x "infra-utils-master/.gitignore" "infra-utils-master/LICENSE" "infra-utils-master/*.md" "infra-utils-master/aws/*"
./setup_aws_cli.sh --exists-action a || travis_terminate 1
./setup_sceptre.sh --exists-action a|| travis_terminate 1


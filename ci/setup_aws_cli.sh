#!/bin/bash
set -e

# double interpolate vars when using multiple branches

eval export "AwsCfServiceRoleArn=$RoleArn"
eval export "AwsTravisAccessKey=$AccessKey"
eval export "AwsTravisSecretAccessKey=$SecretAccessKey"

pip install --upgrade awscli
mkdir ~/.aws
echo -e "[default]\nregion=us-east-1\nsource_profile=default\nrole_arn=$AwsCfServiceRoleArn" > ~/.aws/config
echo -e "[default]\nregion=us-east-1\naws_access_key_id=$AwsTravisAccessKey\naws_secret_access_key=$AwsTravisSecretAccessKey" > ~/.aws/credentials


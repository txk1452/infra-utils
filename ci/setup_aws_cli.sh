#!/bin/bash
set -e

echo "AwsCfServiceRoleArn: $AwsCfServiceRoleArn"
echo "AwsTravisAccessKey: $AwsTravisAccessKey"
echo "AwsTravisSecretAccessKey: $AwsTravisSecretAccessKey"

export AwsCfServiceRoleArn="arn:aws:iam::206727770409:role/hiresearchcf"
export AwsTravisAccessKey="AKIAJJYLUM6JWCBBFILA"
export AwsTravisSecretAccessKey="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"

pip install --upgrade awscli
mkdir ~/.aws
echo -e "[default]\nregion=us-east-1\nsource_profile=default\nrole_arn=$AwsCfServiceRoleArn" > ~/.aws/config
echo -e "[default]\nregion=us-east-1\naws_access_key_id=$AwsTravisAccessKey\naws_secret_access_key=$AwsTravisSecretAccessKey" > ~/.aws/credentials


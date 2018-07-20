# This script is used to set aws account policies in multiple accounts
#!/bin/bash
set -e

# setup AWS profiles in ~/.aws/credentials or ~/.aws/config and enter them here
declare -a profiles=("profile1"
                     "profile2"
                     "profile3")

## use profiles to set policy for each account
for profile in "${profiles[@]}"
do
   echo "setting account policy for $profile"
   aws --profile $profile iam update-account-password-policy \
       --minimum-password-length 8 \
       --require-symbols \
       --require-numbers \
       --require-uppercase-characters \
       --require-lowercase-characters \
       --allow-users-to-change-password \
       --max-password-age 180 \
       --password-reuse-prevention 3 \
       --no-hard-expiry
done


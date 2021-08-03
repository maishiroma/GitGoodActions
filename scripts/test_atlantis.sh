#!/bin/bash

if [[ ! -z $GITHUB_ACTIONS ]] || [[ ! -z $ATLANTIS_TERRAFORM_VERSION ]]; then
    echo "Running script in CI, using creds sourced in CI..."
else
    echo "We are neither in Atlantis nor github"
fi

output=$(aws sts assume-role --role-arn $1 --role-session-name temp --duration-seconds 300)
export AWS_ACCESS_KEY_ID=$(echo $output | jq -r '.Credentials.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo $output | jq -r '.Credentials.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo $output | jq -r '.Credentials.SessionToken')
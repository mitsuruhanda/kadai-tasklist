#!/bin/bash

bundle exec rails db:migrate
echo "start-----------"
echo "curl https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem > ./config/amazon-rds-ca-cert.pem"
echo "-----------end"
curl https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem > ./config/amazon-rds-ca-cert.pem


echo "start-----------"
echo "bundle exec rails db:migrate"
echo "-----------end"
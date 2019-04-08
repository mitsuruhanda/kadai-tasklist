bundle exec rails db:migrate
curl https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem > ./config/amazon-rds-ca-cert.pem
require 'aws'

AWS.config(
  :access_key_id => Rails.application.secrets.s3_acess_key,
  :secret_access_key => Rails.application.secrets.s3_secret_key
)

S3_BUCKET =  AWS::S3.new.buckets[Rails.application.secrets.s3_bucket_name]
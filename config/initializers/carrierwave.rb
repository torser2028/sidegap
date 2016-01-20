CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAIWRAWA62U5H66EFQ',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'us-west-2'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'sidegapfiles' # required
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration
end
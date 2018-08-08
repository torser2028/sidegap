CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJKLPXNK4BPWRTCTA',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'sidegapfilesv2' # required
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration
end
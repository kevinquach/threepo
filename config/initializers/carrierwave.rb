if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'us-west-2',
      host: 's3-us-west-2.amazonaws.com',
      endpoint: 'https://s3-us-west-2.amazonaws.com'
    }
    config.fog_directory  = ENV['FOG_DIRECTORY']
    config.fog_public     = false
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  end
end

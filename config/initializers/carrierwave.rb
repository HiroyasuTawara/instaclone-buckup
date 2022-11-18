CarrierWave.configure do |config|
  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'

  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIA2MJVPVNGVV7TQKV5',
      aws_secret_access_key: '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',
      region:                'ap-northeast-1',
      path_style:            true,
  }

  config.fog_public     = false
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = 'copygram-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/copygram-production'
    when 'development'
      config.fog_directory = 'copygram-development'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/copygram-development'
  end
end
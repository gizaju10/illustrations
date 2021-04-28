unless Rails.env.development? || Rails.env.test?
# unless Rails.env.test?
  CarrierWave.configure do |config|
  # if Rails.env.production? # 本番環境:AWS使用
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }

    config.fog_directory  = ENV['AWS_S3']
    config.cache_storage = :fog
  # else
  #   config.storage :file # 開発環境:public/uploades下に保存
  #   config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  end
end
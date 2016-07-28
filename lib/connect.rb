def connectRancher
# Connect to rancher API
  Rancher::Api.configure do |config|
    config.url = ENV['API_URL']
    config.access_key = ENV['ACCESS_KEY']
    config.secret_key = ENV['SECRET_KEY']
  end
end
  

require 'rancher/api'
require 'dotenv'

# Load .env from root
Dotenv.load

# Connect to rancher API
Rancher::Api.configure do |config|
  config.url = ENV['API_URL']
  config.access_key = ENV['ACCESS_KEY']
  config.secret_key = ENV['SECRET_KEY']
end

project = Rancher::Api::Project.find('infraops')
puts project

stack = Rancher::Api::Environment.find('1e14')
puts stack

# Require
require 'rancher/api'
require_relative 'gatekeeper/version.rb'
require_relative 'gatekeeper/service.rb'
require_relative 'connect.rb'
require_relative 'gatekeeper/status.rb'

if ENV['RUBY_ENV'] == 'development'
  require 'dotenv'
  Dotenv.load
end

# make a global service Hash
@service = Hash.new
# Search for all services that is autoscaling enabled
searchService()

# Checks the app and metadata for scaling
@service.each do |id, value|
  checkApp(id, value)
end

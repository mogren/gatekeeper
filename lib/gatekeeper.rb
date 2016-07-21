# Require
require 'rancher/api'
require_relative 'gatekeeper/scale.rb'
require_relative 'gatekeeper/version.rb'
require_relative 'gatekeeper/service.rb'
require_relative 'connect.rb'

if ENV['RUBY_ENV'] == 'development'
  require 'dotenv'
  Dotenv.load
end

# make a global service Hash
@service = Hash.new
# Search for all services that is autoscaling enabled
searchService()

# Use @service to access app health check
# Use @service to access rancher-metadata for CPU + memory
# If need to scale up or down access Scale class

# Scale services
@service.each do |id, value|
  s = Scale.new(id, value)
#  s.up
end

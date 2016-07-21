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

searchService()
puts @service
#id = Parse.new
#s = Scale.new(id)
#s.up
#sleep 50
#s.down

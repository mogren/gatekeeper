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
searchService()
@service.each do |id, value|
  s = Scale.new(id, value)
  s.up
end

# Require
require 'rancher/api'
require_relative 'gatekeeper/scale.rb'
require_relative 'gatekeeper/version.rb'
require_relative 'gatekeeper/parse.rb'
require_relative 'connect.rb'

if ENV['RUBY_ENV'] == 'development'
  require 'dotenv'
  Dotenv.load
end

search()

s = Scale.new(id)
s.up
#sleep 50
#s.down

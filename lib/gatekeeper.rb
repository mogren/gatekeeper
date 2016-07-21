# Require
require 'rancher/api'
require_relative 'gatekeeper/scale.rb'
require_relative 'gatekeeper/version.rb'
require_relative 'connect.rb'

if ENV['RUBY_ENV'] == 'development'
  require 'dotenv'
  Dotenv.load
end

name = '1s33'
s = Scale.new(name)
s.up
#sleep 50
#s.down

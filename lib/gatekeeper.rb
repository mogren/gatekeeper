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


# def every_n_seconds(n)
# 	  loop do
# 	    before = Time.now
# 	    yield
# 	    interval = n-(Time.now-before)
# 	    sleep(interval) if interval > 0
# 	  end
# 	end
# 	every_n_seconds(5) do
# 	 puts "At the beep, the time will be #{Time.now.strftime("%X")}…beep!"
# 	end

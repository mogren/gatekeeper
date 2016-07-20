# Require
require 'rancher/api'
require 'dotenv'
require 'dogapi'

# Load .env from root
Dotenv.load

def connectRancher()
# Connect to rancher API
  Rancher::Api.configure do |config|
    config.url = ENV['API_URL']
    config.access_key = ENV['ACCESS_KEY']
    config.secret_key = ENV['SECRET_KEY']
  end
end

# Function to scale up
def scaleUp(name)
  connectRancher()
  service = Rancher::Api::Service.find(name)
  s = service.currentScale
  s += 1
  service.scale = s
  service.save
  puts "We now have #{service.scale.real} containers in the stack #{service.name}"
end

def scaleDown(name)
  connectRancher()
  service = Rancher::Api::Service.find(name)
  # Scale the service with one container
  s = service.currentScale
  s -= 1
  service.scale = s
  service.save
  puts "We now have #{service.scale.real} containers in the stack #{service.name}"
end

def checkDog()
  dog = Dogapi::Client.new(ENV['DOGAPI_KEY'], ENV['DOGAPP_KEY'])
end


scaleUp('1s33')
#
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

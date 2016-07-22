require_relative 'scale.rb'
require 'dogapi'

def checkContainers(id,value)
  connectRancher()
  service = Rancher::Api::Service.find(id)
  containers = service.instances
  containers.each do |c|
    puts c.name
    checkDog(c.name)
  end
end

def checkApp (id,value)
  puts "\n"
  puts "Doing http request to http://#{value[0]}.#{value[2]}.rancher.internal/healthz"
  # if value[2] == nil or blank break and next
  #s = Scale.new(id, value)
  #s.up
end

def checkDog (id)
  dog = Dogapi::Client.new(dogkey, dogapp)
  # Get points from the 60 seconds
  from = Time.now - 60
  to = Time.now
  query = 'avg:docker.cpu.user{#{id}},avg:docker.mem.in_use{#{id}}'
  metrics = dog.get_points(query, from, to)
end


# Use @service to access app health check
# Use @service to access rancher-metadata for CPU + memory
  # If need to scale up or down access Scale class
  # Scale services
#@service.each do |id, value|
#  s = Scale.new(id, value)
  #  s.up
#end

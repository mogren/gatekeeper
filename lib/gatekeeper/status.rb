require_relative 'scale.rb'
require 'dogapi'

def checkContainers(id,value)
  connectRancher()
  service = Rancher::Api::Service.find(id)
  containers = service.instances
  containers.each do |c|
    #puts c.name
    #checkApp(c.name)
  end
  #puts service.name
  checkDog(service.name)
end

def checkApp (id,value)
  puts "\n"
  puts "Doing http request to http://#{value[0]}.#{value[2]}.rancher.internal/healthz"
  # if value[2] == nil or blank break and next
  #s = Scale.new(id, value)
  #s.up
end

def checkDog (id)
  dogkey = ENV['DOGAPI_KEY']
  dogapp = ENV['DOGAPP_KEY']

  dog = Dogapi::Client.new(dogkey, dogapp)
  # Get points from the 60 seconds
  from = Time.now - 60
  to = Time.now
    #query for cpu and memory
  cpuQuery = "avg:docker.cpu.user{io.rancher.stack.name:#{id}}"
  cpu = dog.get_points(cpuQuery, from, to)
  memQuery = "avg:docker.mem.in_use{io.rancher.stack.name:#{id}}"
  mem = dog.get_points(memQuery, from, to)
  # make them hasish
  cpu = Hash[*cpu]
  #mem = Hash[*mem]
  cpu = cpu['200']['series']
  #mem = mem['200']['series']
  puts "Data for #{id}"
  cpu[0]['pointlist'].each do |p,v|
    puts "Cpu used #{v}"
  end
  #puts mem[0]['pointlist']
end


# Use @service to access app health check
# Use @service to access rancher-metadata for CPU + memory
  # If need to scale up or down access Scale class
  # Scale services
#@service.each do |id, value|
#  s = Scale.new(id, value)
  #  s.up
#end

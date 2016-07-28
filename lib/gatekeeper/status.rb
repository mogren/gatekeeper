require_relative 'scale.rb'
require 'dogapi'

def checkContainers(id,value)
  connectRancher()
  service = Rancher::Api::Service.find(id)
  containers = service.instances
  containers.each do |c|
    #puts c.name
    #checkApp(c.name)
    checkInflux(c.name)
  end
  #checkDog(service.name, id, value)
end

def checkApp (id,value)
  puts "\n"
  puts "Doing http request to http://#{value[0]}.#{value[2]}.rancher.internal/healthz"
  # if value[2] == nil or blank break and next
  #s = Scale.new(id, value)
  #s.up
end

# Check influx for data
def checkInflux(id)
  puts id
end

# Decap?
def checkDog (id,scaleId,scaleValue)
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
  mem = Hash[*mem]
  cpu = cpu['200']['series']
  mem = mem['200']['series']
  @cpuaverage = []
  @memaverage = []

  if mem.empty?
    puts "No memory data available"
  else
    mem[0]['pointlist'].each do |p,v|
      @memaverage.push(v)
    end
  end
  if cpu.empty?
    puts "No cpu data for #{id}"
  else
    cpu[0]['pointlist'].each do |p,v|
      @cpuaverage.push(v)
    end
  end
  if @cpuaverage.inject(0.0) { |sum, el| sum + el } / @cpuaverage.size > 80
    s = Scale.new(scaleId, scaleValue)
    s.up
  else
    s = Scale.new(scaleId, scaleValue)
    s.down
  end
end
## MAKE ALGORITHM TO CHECK FOR CPU METCIS AVERAGE
## Query influx instead. building agents

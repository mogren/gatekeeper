require_relative 'scale.rb'

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
  database = 'telegraf'
  influxdb = InfluxDB::Client.new database host: "influxDB"
  c = influxdb.query 'SELECT * FROM cpu_usage_user WHERE time > now() - 1m;'
  puts c

end

## MAKE ALGORITHM TO CHECK FOR CPU METCIS AVERAGE
## Query influx instead. building agents

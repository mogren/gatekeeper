require_relative 'scale.rb'

def checkContainers(id,value)
  connectRancher()
  service = Rancher::Api::Service.find(id)
  containers = service.instances
  containers.each do |c|
    checkInflux(c.name)
  end
end

# Check influx for data
def checkInflux(id)
  database = 'telegraf'
  influxdb = InfluxDB::Client.new database, host: "influxDB"
  #influxdb = InfluxDB::Client.new database, host: "52.8.235.35"
  c = influxdb.query "SELECT container_name, host, usage_percent FROM docker_container_cpu WHERE autoscale = 'true' and container_name = 'r-#{id}' and usage_percent > 0 and time > now() - 10m;"
  puts c

end

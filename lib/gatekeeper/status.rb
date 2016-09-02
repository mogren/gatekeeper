require_relative 'scale.rb'

def checkContainers(id,value)
  connectRancher()
  service = Rancher::Api::Service.find(id)
  containers = service.instances
  containers.each do |c|
    checkInflux(c.name)
    # TODO: Something!
  end
end

# Check influx for data
def checkInflux(id)
  database = 'telegraf'
  influxdb = InfluxDB::Client.new database, host: "influxDB"
  # TODO: Add: autoscale = 'true' AND ?
  c = influxdb.query 'SELECT container_name, host, usage_percent FROM docker_container_cpu WITH KEY = "cpu" WHERE time > now() - 1m;'
  puts c
  c.length > 0
end
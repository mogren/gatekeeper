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
  c = influxdb.query 'SELECT * FROM docker_container_cpu WITH KEY = "cpu" WHERE time > now() - 1m;'
  puts c

end

@service = {}

def search
  connectRancher()
  service = Rancher::Api::Service.all.to_a
  service.each do |s|
    @service[s.id] = s.name
  end
  autoscale()
end

def autoscale
  connectRancher()
  @service.each do |id, name|
    service = Rancher::Api::Service.find(id)
    if service.launchConfig.inspect.scan("autoscale").blank?
      @service.delete(service.id) { |el| "#{el} not found" }
      next
    else
      # Put logic here? to remove if health check is ok still?
    end
  end
end

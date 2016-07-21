@service = {}

def searchService
  connectRancher()
  service = Rancher::Api::Service.all.to_a
  service.each do |s|
    @service[s.id] = s.name
  end
  removeServices()
end

def removeServices
  connectRancher()
  @service.each do |id, name|
    service = Rancher::Api::Service.find(id)
    if service.launchConfig.inspect.scan("autoscale").blank?
      @service.delete(service.id) { |el| "#{el} not found" }
      next
    end
  end
end

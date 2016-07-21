# Search for all services and put them into a hash
def searchService
  connectRancher()
  service = Rancher::Api::Service.all.to_a
  service.each do |s|
    #Search for autoscale tag
    scale = s.launchConfig["labels"].select {|k,v| k["autoscale"] }
    if scale.values[0] == "true"
      #@service[s.id] = s.name
      @service[s.id] ||= Array.new
      @service[s.id] << s.name
      # Add checks to see if maxscale + value is nil? or blank?
      maxscale = s.launchConfig["labels"].select {|k,v| k["maxscale"] }
      @service[s.id] << maxscale.values[0]
      stack = Rancher::Api::Environment.find(s.environmentId)
      @service[s.id] << stack.name
    end
  end
end

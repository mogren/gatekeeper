require_relative 'scale.rb'

def checkApp (id,value)
  puts "\n"
  puts "Doing http request to http://#{value[0]}.#{value[2]}.rancher.internal/healthz"
  puts "Doing data dog http request"
  # if value[2] == nil or blank break and next
  #s = Scale.new(id, value)
  #s.up
end


# Use @service to access app health check
# Use @service to access rancher-metadata for CPU + memory
  # If need to scale up or down access Scale class
  # Scale services
#@service.each do |id, value|
#  s = Scale.new(id, value)
  #  s.up
#end

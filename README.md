# gatekeeper

if RUBY_ENV="development" read from .env

Environment variables needed
API_URL
ACCESS_KEY
SECRET_KEY

```ruby
 Function to scale up
 def scaleUp(name)
   connectRancher()
   service = Rancher::Api::Service.find(name)
   s = service.currentScale
   s += 1
   service.scale = s
   service.save
   puts "We now have #{service.scale.real} containers in the stack #{service.name}"
 end
 ```
```ruby
 require 'json'

 def checkRancher()
   resource = RestClient::Resource.new 'http://rancher.accedo.tv:8080/v1/projects/1a7/containers/1i344/containerstats', 'BB3A9DEA12D944B9D294', 'wJWxe4e8fHHUr8jFfoD62xTU1hz9nS45nn4mjwJG'
   r = resource.get.to_json :content_type => 'application/json'
 end
```

```ruby
require 'rancher/api'
require 'dotenv'
require 'json'
Dotenv.load
Rancher::Api.configure do |config|
  config.url = ENV['API_URL']
  config.access_key = ENV['ACCESS_KEY']
  config.secret_key = ENV['SECRET_KEY']
end
service = Rancher::Api::Service.find('1a33')
json_hash = JSON.parse(service.attributes.to_json)
json_hash["launchConfig"].find { |h| h['labels'] == 'autoscale' }['true']



service.attributes.keys
File.open("temp.json","w") do |f|
  f.write(service.attributes.to_json)
end

service = Rancher::Api::Service.all.to_a
service.each do |s|
  s.select{ |k, v| puts k }
  #s.include?("\"autoscale\"=>\"true\"")
end
```

```ruby
 def every_n_seconds(n)
 	  loop do
 	    before = Time.now
 	    yield
 	    interval = n-(Time.now-before)
 	    sleep(interval) if interval > 0
 	  end
 	end
 	every_n_seconds(5) do
 	 puts "At the beep, the time will be #{Time.now.strftime("%X")}…beep!"
 	end
```

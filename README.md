# gatekeeper

if RUBY_ENV="development" read from .env

Environment variables needed
API_URL
ACCESS_KEY
SECRET_KEY

Label in rancher
autoscale = ""

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

#todo: fix service class?
#todo: connect global?

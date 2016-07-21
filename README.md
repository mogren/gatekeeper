# gatekeeper

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

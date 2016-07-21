class Scale
  def initialize(id)
    @id = id
  end

  def up
    connectRancher()
    service = Rancher::Api::Service.find(@id)
    s = service.currentScale
    s += 1
    service.scale = s
    service.save
    puts "We now have #{service.scale.real} containers in the stack #{service.name}"
  end

  def down
    connectRancher()
    service = Rancher::Api::Service.find(@id)
    # Scale the service with one container
    s = service.currentScale
    s -= 1
    service.scale = s
    service.save
    puts "We now have #{service.scale.real} containers in the stack #{service.name}"
  end
end

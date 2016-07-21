class Scale
  def initialize(id, value)
    @id = id
    @name = value[0]
    @maxscale = value[1].to_i
  end

  def up
    connectRancher()
    service = Rancher::Api::Service.find(@id)
    s = service.currentScale
    # Check if stack is lower or equal to maxscale
    if s <= @maxscale
      s += 1
      service.scale = s
      service.save
      puts "We now have #{service.scale.real} containers in the stack #{service.name}"
    else
      puts "Your max containers has been reached. Please change the stack value"
    end
  end

  def down
    connectRancher()
    service = Rancher::Api::Service.find(@id)
    s = service.currentScale
    # If you only have one container left
    if s == 1
      puts "Cant scale down below 1 container"
    else
      s -= 1
      service.scale = s
      service.save
      puts "We now have #{service.scale.real} containers in the stack #{service.name}"
    end
  end
end

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
      puts "#{service.name} now have #{service.scale.real} containers"
    else
      puts 'Your max containers has been reached. Please change the stack value'
    end
  end

  def down
    connectRancher()
    service = Rancher::Api::Service.find(@id)
    s = service.currentScale
    env = service.launchConfig['labels'].select {|k,v| k['environment'] }
    case env
    when 'dev'
      minScale = 1
    when 'prod'
      minScale = 2
    else
      minScale = 1
    end
    # If you only have one container left
    if s == minScale
      puts "Cant scale down below #{minScale} container"
    else
      s -= 1
      service.scale = s
      service.save
      puts "We now have #{service.scale.real} containers in the stack #{service.name}"
    end
  end
end

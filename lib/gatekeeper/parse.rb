class Parse
  def initialize(label)
    @label = label
  end

  def search
    connectRancher()
    service = Rancher::Api::Service.all.to_a
    service.each do |s|
      s.select{ |k, v| puts k
      #s.include?("\"autoscale\"=>\"true\"")
    end
end

class Parse
  def initialize(label)
    @label = label
    @name = Array.new
  end

  def search
    connectRancher()
    service = Rancher::Api::Service.all.to_a
    service.each do |s|
      s.name
      #s.include?("\"autoscale\"=>\"true\"")
    end
end

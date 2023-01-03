class Exhibit
          attr_reader :name,
                      :cost
  def initialize(information)
    @name = information[:name]
    @cost = information[:cost]
    
  end
end
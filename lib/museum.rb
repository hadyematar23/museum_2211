class Museum
      attr_reader :name, 
                  :exhibits
  def initialize(name)
    @name = name 
    @exhibits = []
    
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    reccomendations = []
    @exhibits.each do |exhibit|
      patron.interests.each do |interest|
        if exhibit.name == interest
          reccomendations << exhibit
        end
      end
    end 
    return reccomendations
    
  end
end
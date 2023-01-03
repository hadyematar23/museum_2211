class Museum
      attr_reader :name, 
                  :exhibits, 
                  :patrons
  def initialize(name)
    @name = name 
    @exhibits = []
    @patrons = []
    
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
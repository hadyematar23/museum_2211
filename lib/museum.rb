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

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    hash = Hash.new { |hash, key| hash[key] = [] }

      @exhibits.each do |exhibit|
        hash[exhibit]
      end 
      
      @exhibits.each do |exhibit|
        @patrons.each do |patron|
          if recommend_exhibits(patron).include?(exhibit)
            hash[exhibit] << patron
          end
        end
      end 
    return hash
    end 
       
    def ticket_lottery_contestants(exhibit)
      contestants = patrons_by_exhibit_interest[exhibit].select do |patron|
        patron.spending_money < exhibit.cost
      end      
    end

    def draw_lottery_winner(exhibit)
      person = ticket_lottery_contestants(exhibit).sample
      
      if person != nil 
        return person.name 
      else 
        return nil
      end
    end

  
   

end
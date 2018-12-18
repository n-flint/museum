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
    recomended = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        recomended << exhibit
      end
    end
    recomended
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    sorted_hash = {}
    @exhibits.each do |exhibit|
      sorted_hash[exhibit] = []
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          sorted_hash[exhibit] << patron
        end
      end
    end
    sorted_hash
  end

  def attend_exhibits(patron)
    exhibits_attended = []
    @exhibits.each do |exhibit|
      if exhibit.cost <= patron.spending_money && recommend_exhibits(patron).include?(exhibit.name)
        exhibits_attended << patron
      elsif
        exhibit.cost > patron.spending_money
      end
    end
    exhibits_attended
  end
end

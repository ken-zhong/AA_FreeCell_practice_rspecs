# NOTE the subclasses! There are multiple classes in this file

class Pile
  def initialize
  end

  #should return the top card of the pile
  def top_card
  end

  def empty?
  end

  #returns the number of cards in the pile
  def count
  end

  #lets you add a card to the top of the pile
  def add_card(card)
  end

  #removes a card from the top of the pile
  def take_card
  end


end

# NOTE I'm leaving these mostly blank in the skeleton for a bit of an extra
# challenge. Think about what's necessary over the base pile class!

class FreeCell < Pile
end

class Tableau < Pile
end

class Foundation < Pile
end

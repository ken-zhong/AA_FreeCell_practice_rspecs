# NOTE the subclasses! There are multiple classes in this file

class Pile
  def initialize
    @store = []
  end

  #should return the top card of the pile
  def top_card
    raise 'This pile is empty!' if empty?
    @store.last
  end

  def empty?
    @store.empty?
  end

  #returns the number of cards in the pile
  def count
    @store.count
  end

  #lets you add a card to the top of the pile
  def add_card(card)
    raise "invalid placement!" unless valid_placement?(card)
    @store << card
  end

  #removes a card from the top of the pile
  def take_card
    @store.pop
  end

  def valid_placement?(card)
    true
  end
end

# NOTE I'm leaving these mostly blank in the skeleton for a bit of an extra
# challenge. Think about what's necessary over the base pile class!

class FreeCell < Pile
  def valid_placement?(card)
    return true if empty?
    false
  end
end

class Tableau < Pile
  def add_card_setup(card)
    @store << card
  end

  def valid_placement?(card)
    return true if empty?
    return false if top_card.freecell_color == card.freecell_color
    return false if top_card.freecell_value != card.freecell_value + 1
    true
  end
end

class Foundation < Pile
  def valid_placement?(card)
    if empty?
      return true if card.value == :ace
      false
    else
      return true if top_card.suit == card.suit && top_card.freecell_value == card.freecell_value - 1
    end
    false
  end
end

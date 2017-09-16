require_relative 'card'
require_relative 'deck'
require_relative 'pile'


class Board

  attr_reader :deck, :foundations, :freecells, :tableaus

  def initialize(deck)

    #NOTE call the setup helper method in here! Don't dump all the code in init

  end

  def setup_board

  end

  def won?
  end

end

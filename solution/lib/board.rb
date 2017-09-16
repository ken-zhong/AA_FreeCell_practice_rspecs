require_relative 'card'
require_relative 'deck'
require_relative 'pile'


class Board

  attr_reader :deck, :foundations, :freecells, :tableaus

  def initialize(deck)
    @deck = deck
    @foundations = Array.new(4) { Foundation.new }
    @freecells = Array.new(4) { FreeCell.new }
    @tableaus = Array.new(8) { Tableau.new }

    #NOTE call the setup helper method in here! Don't dump all the code in init
    setup_board
  end

  def setup_board
    until @deck.count == 0
      @tableaus.each do |pile|
        break if @deck.count == 0
        card = deck.take(1).first
        pile.add_card_setup(card)
      end
    end
  end

  def won?
  end
end

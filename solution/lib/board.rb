require_relative 'card'
require_relative 'deck'
require_relative 'pile'


class Board

  attr_reader :deck, :foundations, :freecells, :tableaus

  def initialize(deck)
    @deck = deck
    @foundations = []
    @freecells = []
    @tableaus = []

    #NOTE call the setup helper method in here! Don't dump all the code in init
    setup_board
  end

  def setup_board
    8.times { tableaus << Tableau.new }
    4.times { freecells << FreeCell.new }
    4.times { foundations << Foundation.new }

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

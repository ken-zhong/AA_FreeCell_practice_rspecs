require 'board'
require 'card'
require 'deck'

describe Board do
  describe '#initialize' do
    deck = Deck.new
    board = Board.new(deck)

    it 'should initialize with a deck of cards' do
      expect(board.deck).to eq(deck)
    end

    it 'should initialize with arrays to store the foundation, tableau, and freecell piles' do
      expect(board.foundations).to be_a(Array)
      expect(board.freecells).to be_a(Array)
      expect(board.tableaus).to be_a(Array)
    end
  end

  describe '#setup_board' do
    deck = Deck.new
    board = Board.new(deck)
    it 'should set up with 8 tableau piles' do
      expect(board.tableaus.count).to eq(8)
    end

    it 'should ensure that all 52 cards are distributed amongs the 8 tableau piles' do
      expect(deck.count).to eq(0)
      expect(board.tableaus[0].count).to be_within(1).of(6)
      expect(board.tableaus[6].count).to be_within(1).of(6)
    end

    it 'should set up 4 empty FreeCell cells' do
      expect(board.freecells.count).to eq(4)
      expect(board.freecells[0].empty?).to be true
    end

    it 'should set up 4 empty Foundation cells' do
      expect(board.foundations.count).to eq(4)
      expect(board.foundations[0].empty?).to be true
    end
  end

  describe '#won?' do
    it 'should correctly return true when the player wins!'
  end

end

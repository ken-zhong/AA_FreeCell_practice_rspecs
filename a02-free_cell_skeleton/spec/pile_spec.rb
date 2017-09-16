require 'pile.rb'

describe Pile do
  subject(:pile) {Pile.new}

  describe '#count' do
    let(:card) {double('card')}
    it 'should return the number of cards in its pile' do
      pile.add_card(card)
      pile.add_card(card)
      expect(pile.count).to eq(2)
    end
  end

  describe '#top_card' do
    # for the purposes of this rspec, use the end of the array
    let(:card1) {double('card1')}
    let(:card2) {double('card2')}
    let(:card3) {double('card3')}

    it 'should raise an error if the pile is empty' do
      p pile
      p pile.store
      expect{ pile.top_card }.to raise_error('This pile is empty!')
    end

    it 'should return the card at the top of the pile' do
      pile.add_card(card1)
      pile.add_card(card2)
      pile.add_card(card3)
      expect(pile.top_card).to eq(card3)
    end
  end
end

describe FreeCell do
  subject(:freecell){FreeCell.new}
  let(:card1) {double('card1')}

  describe '#add_card' do
    it 'should let you add cards to it' do
      freecell.add_card(card1)
      expect(freecell.top_card).to eq(card1)
    end

    it 'should let you remove cards from it' do
      freecell.add_card(card1)
      expect(freecell.take_card).to eq(card1)
      expect(freecell.empty?).to be true
    end
  end
end

describe Foundation do
  subject(:foundation){Foundation.new}
  let(:card1) { Card.new(:hearts, :ace)}
  let(:card2) { Card.new(:hearts, :deuce)}

  describe '#add_card' do
    it 'should let you add aces to an empty foundation pile' do
      foundation.add_card(card1)
      expect(foundation.top_card).to eq(card1)
    end

    it 'should raise an error if you try to add a non-Ace to an empty foundation pile' do
      expect{ foundation.add_card(card2)}.to raise_error('invalid placement!')
    end

    it 'should let you add consecutive numbered cards to a foundation pile' do
      foundation.add_card(card1)
      foundation.add_card(card2)
      expect(foundation.top_card).to eq(card2)
    end
  end
end

describe Tableau do
  subject(:tableau){Tableau.new}
  let(:card1) { Card.new(:spades, :queen)}
  let(:card2) { Card.new(:hearts, :jack)}

  describe '#add_card' do
    it 'should let you add any card to an empty tableau pile' do
      tableau.add_card(card2)
      expect(tableau.top_card).to eq(card2)
    end

    it 'should let you add consecutive numbered and alternate colored cards to a tableau pile' do
      tableau.add_card(card1)
      tableau.add_card(card2)
      expect(tableau.top_card).to eq(card2)
    end

    it 'should raise an error if you try to add a non-conforming card to the pile' do
      tableau.add_card(card2)
      expect{ tableau.add_card(card1)}.to raise_error("invalid placement!")
    end
  end
end

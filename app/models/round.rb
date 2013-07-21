class Round < ActiveRecord::Base
  # Remember to create a migration!
  validates :user_id, presence: true
  validates :deck_id, presence: true
  
  belongs_to :user
  has_many :guesses
  belongs_to :deck
  has_many :cards, :through => :deck

  scope: right, -> {where(Round.guesses.correct? => '1')}
  scope: wrong, -> {where(Round.guesses.correct? => '0')}


  def generate_cards(deck_id)
    cards = Deck.find(deck_id).cards
    card_ids = []
    cards.each do |card|
      card_ids << card.id
    end 
    card_ids
  end
end

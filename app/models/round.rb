class Round < ActiveRecord::Base
  # Remember to create a migration!
  validates :user_id, presence: true
  validates :deck_id, presence: true
  def generate_cards(deck_id)
  deck = Deck.find(deck_id)
  cards = deck.cards
  card_ids = []
  cards.each do |card|
    card_ids << card.id
  end 
  card_ids
end

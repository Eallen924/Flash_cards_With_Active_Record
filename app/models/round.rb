class Round < ActiveRecord::Base
  # Remember to create a migration!
  def generate_cards(deck_id)
  deck = Deck.find(deck_id)
  cards = deck.cards
  card_ids = []
  cards.each do |card|
    card_ids << card.id
  end 
  card_ids
end

get '/decks'
  @decks = Deck.all
  erb: decks
end

get '/decks/:deck_id'
  @round = Round.create(:deck_id)

get '/decks' do
  @decks = Deck.all
  erb :decks
end

get '/decks/:deck_id' do
  @round = Round.create(:deck_id)
end

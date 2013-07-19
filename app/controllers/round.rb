get '/round/:deck_id' do
  round = Round.create(deck_id: params[:deck_id], user_id: current_user.id)
  session[:card_ids] = round.generate_cards(params[:deck_id])
  @card = Card.find(session[:card_ids].sample)
  erb :round
end

post '/deck/:deck_id/round/:round_id/card/:card_id' do
  params
  erb :guess
end

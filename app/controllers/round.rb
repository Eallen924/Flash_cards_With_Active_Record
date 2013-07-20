get '/round/:deck_id' do
  while session[:card_ids].length > 0
    @round = Round.create(deck_id: params[:deck_id], user_id: current_user.id)
    puts "THIS SHIT BETTER FUCKING WORK"
    session[:card_ids] = @round.generate_cards(params[:deck_id]) unless session[:card_ids]
    @card = Card.find(session[:card_ids].sample)
    erb :round
  end
   redirect to '/user/:user_id/round/round_id/stats'
end

post '/deck/:deck_id/round/:round_id/card/:card_id' do
  params
  erb :round
end

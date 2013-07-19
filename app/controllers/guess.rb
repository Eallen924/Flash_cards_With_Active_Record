get '/deck/:deck_id/round/:round_id/card/:card_id/guess/:guess_id' do
  
  if params[:guess][:term] == params[:guess][:user_guess]
    @guess = Guess.create(card_id: :card_id, correct?: 1, user_guess: params[:guess][:user_guess])
    session[:card_ids].delete_if {|card| card.card_id == :card_id}
    erb :answer
  else
    @guess = Guess.create(card_id: :card_id, correct?: 0, user_guess: params[:guess][:user_guess])
    erb :answer
  end
end

post '/deck/:deck_id/round/:round_id/card/:card_id/guess' do
  
  if params[:guess][:term] == params[:guess][:user_guess]
    @guess = Guess.create(card_id: params[:card_id], round_id: params[:round_id], correct?: '1', user_guess: params[:guess][:user_guess])
    session[:card_ids].delete_if {|id| id == params[:card_id].to_i}
    puts "IM CORRECT"
    erb :answer
  else
    @guess = Guess.create(card_id: params[:card_id], round_id: params[:round_id], correct?: '0', user_guess: params[:guess][:user_guess])
    @card = Card.find(params[:card_id])

    erb :answer
  end
end

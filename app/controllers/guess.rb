get '/deck/:deck_id/round/:round_id/card/:card_id/guess/:guess_id' do
  if params[:guess][:term] == params[:guess][:user_guess]
    session[:card_ids].select
  else
    #giv
  end
 @card = Card.find(session[:card_ids].sample)

end

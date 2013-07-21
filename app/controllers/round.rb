get '/round/:deck_id' do
  @round = Round.find_or_create_by(deck_id: params[:deck_id], user_id: current_user.id)
  session[:card_ids] = @round.generate_cards(params[:deck_id]) unless session[:card_ids]
  if request.xhr?
    if session[:card_ids].length > 0
      @card = Card.find(session[:card_ids].sample)
      erb :round, :layout => false
    else
     session[:card_ids].clear
     redirect to "/user/#{current_user.id}/round/#{@round.id}/stats"
    end
 else
    if session[:card_ids].length > 0
      @card = Card.find(session[:card_ids].sample)
      erb :round
    else
     session[:card_ids].clear
     redirect to "/user/#{current_user.id}/round/#{@round.id}/stats"
    end
  end
end

post '/deck/:deck_id/round/:round_id/card/:card_id' do
  params
  erb :round
end

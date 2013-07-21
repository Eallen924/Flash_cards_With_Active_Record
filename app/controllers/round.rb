get '/round/:deck_id' do
  puts "I AM GETTING HIT BY THE AJAX"
  @round = Round.find_or_create_by(deck_id: params[:deck_id], user_id: current_user.id)
  @right = @round.guesses.where(correct?:1)
  @wrong = @round.guesses.where(correct?:0)
  @stats = GChart.pie do |pie|
        pie.data = [@right.count, @wrong.count]
        pie.width = 500
        pie.legend = ["Right", "Wrong"]
  end
  session[:card_ids] = @round.generate_cards(params[:deck_id]) unless session[:card_ids]
  if request.xhr?
    if session[:card_ids].length > 0
      @card = Card.find(session[:card_ids].sample)
      erb :round, :layout => false
    else
     session[:card_ids].clear
     erb :round_stats
    end
 else
    if session[:card_ids].length > 0
      @card = Card.find(session[:card_ids].sample)
      erb :round
    else
     session[:card_ids].clear
     erb :round_stats
    end
  end
end

post '/deck/:deck_id/round/:round_id/card/:card_id' do
  params
  erb :round
end

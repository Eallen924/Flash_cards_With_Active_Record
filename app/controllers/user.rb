get '/users/:id/decks' do
  @decks = Deck.all
  @user = User.find_by(:id)
  erb :user_home
end

get '/users/:id/profile' do
  @user = User.find_by(:id)
  erb :user_profile
end

post '/user/create' do 
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect to '/decks'
  else
    @errors = @user.errors
    redirect to '/'
  end
end

get '/user/:user_id/round/:round_id/stats' do
  @round = Round.find(params[:round_id])
  erb :round_stats
end

post '/user/login' do 
  p params
  @user = User.authenticate(params[:user][:username], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect to '/decks'
  else
    @errors = "Invalid login info \n Please try again."
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect to '/'
end

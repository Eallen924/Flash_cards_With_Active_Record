get 'users/:id/decks' do
  @decks = Deck.all
  @user = User.find_by(:id)
  erb :user_home
end

get 'users/:id/profile' do
  @user = User.find_by(:id)
  @decks #method to find deck of users
  @rounds
  erb :user_profile
end

post 'user/create' do 
  @user = User.new(params[:user])
  if @user.save


end

post 'user/login' do 
  @user = User.authenticate(params[:user][:username], params[:user][:password])
  if @user
    session[:user_id] = @user.id
  else
    @error = "Invalid login info \n Please try again."
end

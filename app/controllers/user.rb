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



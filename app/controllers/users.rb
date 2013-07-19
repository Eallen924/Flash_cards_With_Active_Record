get 'users/:id' do
  @decks = Deck.all
  @user = User.find_by(:id)
  erb :user_home
end

get '/' do
  if current_user
    redirect to '/decks'
  else
    erb :index
  end
end


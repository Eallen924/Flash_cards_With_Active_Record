get '/' do
  if current.user
    redirect to '/decks'
  else
    erb :index
  end
end


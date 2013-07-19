deck1 = Deck.new(:name => "States and Capitals")
CSV.foreach('States.csv', :headers => true) do |row| 
  Card.create(:term => row[0], :definition => row[2], :deck_id = deck1.id )
end

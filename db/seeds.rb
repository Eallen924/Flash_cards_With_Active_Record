require 'csv'

deck1 = Deck.create(:name => "States and Capitals")

CSV.foreach('StatesData/States.csv', :headers => true) do |row| 
  Card.create(:term => row[2], :definition => row[0], :deck_id => deck1.id )
end

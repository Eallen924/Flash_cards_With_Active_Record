require 'csv'

deck1 = Deck.create(:name => "States and Capitals Easy")

CSV.foreach('StatesData/States1.csv', :headers => true) do |row| 
  Card.create(:term => row[2], :definition => row[0], :deck_id => deck1.id )
end

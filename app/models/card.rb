class Card < ActiveRecord::Base
  # Remember to create a migration!
  validates :deck_id, presence: true
  validates :term, presence: true
  validates :definition, presence: true

  belongs_to :deck
end

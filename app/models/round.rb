class Round < ActiveRecord::Base
  # Remember to create a migration!
  validates :user_id, presence: true
  validates :deck_id, presence: true
end

class Guess < ActiveRecord::Base
  # Remember to create a migration!
  validates :card_id, presence: true
  validates :round_id, presence: true
  validates :correct?, presence: true 
  validates_inclusion_of :correct?, :in => [ 1, 0 ]
  validates :user_guess, presence: true
end

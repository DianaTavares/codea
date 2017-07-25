class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guesses
  has_many :rounds
end

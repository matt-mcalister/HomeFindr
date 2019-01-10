class Hunt < ApplicationRecord
  has_many :listings
  has_many :user_hunts
  has_many :users, through: :user_hunts
end

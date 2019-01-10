class UserHunt < ApplicationRecord
  belongs_to :user
  belongs_to :hunt
end

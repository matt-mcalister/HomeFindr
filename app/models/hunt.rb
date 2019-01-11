class Hunt < ApplicationRecord
  has_many :listings
  has_many :user_hunts
  has_many :users, through: :user_hunts

  def to_json
    {
      id: self.id,
      name: self.name,
      listings: self.listings.map(&:to_json)
    }
  end
end

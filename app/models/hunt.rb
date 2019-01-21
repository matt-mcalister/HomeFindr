class Hunt < ApplicationRecord
  has_many :listings, dependent: :destroy
  has_many :user_hunts, dependent: :destroy
  has_many :users, through: :user_hunts

  def to_json
    {
      id: self.id,
      name: self.name
    }
  end
end

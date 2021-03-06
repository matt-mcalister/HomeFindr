class User < ApplicationRecord
  has_many :user_hunts
  has_many :hunts, through: :user_hunts
  has_many :listings, through: :hunts

  def to_json
    {
      id: self.id,
      email: self.email,
      hunts: self.hunts.map(&:to_json),
      listings: self.listings.map(&:to_json)
    }
  end

  def hunts_with_listings
    self.hunts.each_with_object({}) do |h, hash|
      hash[h.id] = {
        id: h.id,
        name: h.name,
        created_at: h.created_at,
        updated_at: h.updated_at,
        listings: h.listings
      }
    end
  end

  def hunts_with_users
    self.hunts.each_with_object({}) do |h, hash|
      hash[h.id] = {
        id: h.id,
        name: h.name,
        created_at: h.created_at,
        updated_at: h.updated_at,
        users: h.users
      }
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

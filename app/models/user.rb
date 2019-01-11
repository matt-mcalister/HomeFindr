class User < ApplicationRecord
  has_many :user_hunts
  has_many :hunts, through: :user_hunts
  has_many :listings, through: :hunts

  def most_recent_hunt
    if hunts.empty?
      h = Hunt.create(name: "My Awesome Hunt")
      hunts << h
      h
    else
      hunts.last
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

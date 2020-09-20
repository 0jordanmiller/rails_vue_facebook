class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  has_many :friendships, dependent: :destroy, foreign_key: "user_id", class_name: "Friendship"
  has_many :friends, through: :friendships


    def befriend(user)
      # TODO: put in check that association does not exist
      self.friends << user
      user.friends << self
    end
end

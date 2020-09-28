class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  has_many :friendships, dependent: :destroy, foreign_key: "user_id", class_name: "Friendship"
  has_many :friends, through: :friendships

  has_many :sent_requests, class_name: "FriendRequest", foreign_key: "sender_id"
  has_many :received_requests, class_name: "FriendRequest", foreign_key: "receiver_id"

  has_many :senders, through: :sent_requests, source: :receiver, foreign_key: "sender_id"
  has_many :receivers, through: :received_requests, source: :sender, foreign_key: "receiver_id"

    def befriend(user)
      # TODO: put in check that association does not exist
      self.friends << user
      user.friends << self
    end


end

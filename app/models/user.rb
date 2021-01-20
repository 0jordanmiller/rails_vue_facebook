class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture
  has_one_attached :cover_picture

  has_many :posts, dependent: :destroy

  has_many :notifications

  has_many :likes, foreign_key: 'like_id', class_name: 'Like'
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments, foreign_key: 'comment_id', class_name: 'Comment'
  has_many :commented_posts, through: :comments, source: :post

  has_many :friendships, dependent: :destroy, foreign_key: 'user_id', class_name: 'Friendship'
  has_many :friends, through: :friendships

  has_many :sent_requests, class_name: 'FriendRequest', foreign_key: 'sender_id'
  has_many :received_requests, class_name: 'FriendRequest', foreign_key: 'receiver_id'

  has_many :sent_to, through: :sent_requests, source: :receiver, foreign_key: 'sender_id'
  has_many :received_from, through: :received_requests, source: :sender, foreign_key: 'receiver_id'

  def befriend(user)
    # TODO: put in check that association does not exist
    friends << user
    user.friends << self
  end 
end

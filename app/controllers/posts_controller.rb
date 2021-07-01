module PostDataHelper
  def post_data(users)
    posts_data = []
    users.each do |user|
      user.posts.each do |post|
        posts_data.push([{post: post, comments: post&.comments, likes: post&.likes}])
      end
    end
    posts_data
  end
end

class PostsController < ApplicationController
  def index
    account = User.includes(:friends).find(get_posts[:user_id])
    if get_posts[:page_type] == 'home'
      friend_ids = account.friends.map(&:id)
      friend_ids.push(get_posts[:user_id])
      users = User.includes(:posts).find(friend_ids)
    else
      users = [account]
    end
    posts_data = helpers.post_data(user)

    render json: posts_data.to_json

  end

  # def show
  #   Post.find_by
  # end

  def updated
    p 'this has been updateed'
    updated_comments = Post.find_by(id).comments
    render json: updated_comments.to_json
  end

  def create
    p 'is it live'
    post = Post.new(whitelisted)
    post.save
  end

  def destroy
    Post.find_by(id).destroy
  end

  private

  def whitelisted
    params.require(:post).permit(:post, :user_id, :name)
  end

  def id
    params.permit(:id)
  end

  def get_posts
    params.permit(:page_type, :user_id)
  end
end

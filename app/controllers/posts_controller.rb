class PostsController < ApplicationController
  def index
    current_user = User.includes(:friends).find_by(id: get_posts[:user_id])
    if get_posts[:page_type] == 'home'
      friend_id = current_user.friends.map(&:id)
      posts = User.includes(:posts).find(friend_id)
      posts = posts.map { |user| user.posts }
      posts = if posts.any?
                posts.sum + current_user.posts
              else
                current_user.posts
              end
    else
      posts = current_user.posts
    end
    posts = posts.sort_by(&:created_at)
    posts.reverse!
    profile_pictures = { current_user.id => current_user.profile_picture }
    names = { current_user.id => current_user.name }

    current_user.friends.each do |user|
      names[user.id] = user.name
      # profile_pictures[user.id] = user.profile_picture
    end
    ids = posts.map(&:id)
    posts = Post.includes(:comments, :likes).find(ids)

    likes = posts.map(&:likes)
    comments = posts.map(&:comments)

    post_hash = {
      posts: posts,
      comments: comments,
      likes: likes,
      names: names,
      profile_pictures: profile_pictures
    }
    render json: post_hash.to_json
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

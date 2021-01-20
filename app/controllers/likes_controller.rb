class LikesController < ApplicationController
  def create
    Post.find(like_create[:post_id]).likers << User.find(like_create[:user_id])
  end

  def destroy
    p Post.find(like[:post_id]).likes.find_by(user_id: like[:user_id]).destroy
  end

  private

  def like
    params.permit(:post_id, :user_id)
  end

  def like_create
    params.permit(:post_id, :user_id)
  end
end

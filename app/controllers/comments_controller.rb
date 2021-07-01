class CommentsController < ApplicationController
  def create
    p create_comment
    p 'test'
    Post.find_by(id: create_comment[:post_id]).comments << Comment.create(create_comment)
  end

  def destroy
    Comment.find_by(destroy_comment).destroy
  end

  private

  def destroy_comment
    params.permit(:id)
  end

  def create_comment
    params.require(:params).permit(:post_id, :user_id, :comment, :commenter)
  end
end

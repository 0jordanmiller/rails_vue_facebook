class CommentsController < ApplicationController
  def create
    Post.find_by(id: create_comment[:post_id]).comments << Comment.create(user_id: create_comment[:user_id], comment: create_comment[:comment], commenter: create_comment[:commenter])
  end

  def destroy
    Comment.find_by(id: destroy_comment[:id]).destroy
  end

  private

  def destroy_comment
    params.permit(:id)
  end

  def create_comment
    params.require(:params).permit(:post_id, :user_id, :comment, :commenter)
  end
end

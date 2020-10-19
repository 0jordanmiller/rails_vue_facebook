class CommentsController < ApplicationController
    def create
        Post.find_by(id: comment[:post_id]).comments << Comment.create(user_id: comment[:user_id], comment: comment[:comment])
    end

    def destroy

    end

    private
    def comment
        params.require(:params).permit(:post_id, :user_id, :comment)
    end
    
end

class LikesController < ApplicationController
    def create
       Post.find_by(id: like_create[:post_id]).likers << User.find_by(id: like_create[:user_id])
    end

    def destroy
        p  Post.find_by(id: like[:post_id]).likes.find_by(user_id: like[:user_id]).destroy
    end

    private

    def like
        params.permit(:post_id, :user_id)
    end
    
    def like_create
        params.require(:params).permit(:post_id, :user_id)
    end
end

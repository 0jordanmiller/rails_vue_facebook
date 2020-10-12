class LikesController < ApplicationController
    def create
       Post.find_by(id: create_post[:post_id]).likers << User.find_by(id: create_post[:user_id])
    end

    def destroy
        
    end

    private

    def create_post
        params.require(:params).permit(:post_id, :user_id)
    end
end

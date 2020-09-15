class PostsController < ApplicationController
    def index

    end
    
    def create
        @post = Post.new(whitelisted)
        @post.save
    end

    def whitelisted
        params.require(:post).permit(:post, :user_id)
    end
end

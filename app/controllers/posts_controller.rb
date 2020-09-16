class PostsController < ApplicationController
    def index
        posts = Post.where(posts_by_id)
        render json: posts.to_json
    end
    
    def create
        @post = Post.new(whitelisted)
        @post.save
    end

  def get_posts
    posts = Post.all
    render json: posts.to_json
  end

    private
    def whitelisted
        params.require(:post).permit(:post, :user_id, :name)
    end
    def posts_by_id
        params.permit(:user_id)
    end
end

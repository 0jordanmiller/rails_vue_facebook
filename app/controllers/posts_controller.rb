class PostsController < ApplicationController
    def index
        if get_posts[:page_type] == 'home'
            posts = User.find_by(id: get_posts[:user_id]).friends.map do |user|
                user.posts
            end
            posts = posts.sum + User.find_by(id: get_posts[:user_id]).posts
        elsif get_posts[:page_type] == 'profile'
            posts = User.find_by(id: get_posts[:user_id]).posts
        end
        posts_likes = []
        likes = posts.map {|post| post.likes}
        comments = posts.map {|post| post.comments}
        posts_likes.push(posts, likes, comments)

        render json: posts_likes.to_json
    end
    
    def create
        @post = Post.new(whitelisted)
        @post.save
    end


    private

    def set_default_response_format
         request.format = :json
    end
    def whitelisted
        params.require(:post).permit(:post, :user_id, :name)
    end
    def get_posts
        params.permit(:page_type, :user_id)
    end
end

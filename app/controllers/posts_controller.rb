class PostsController < ApplicationController
    

    def index
        if page_type[:page_type] == 'home'
            posts = User.find_by(id: page_type[:user_id]).friends.map do |user|
                user.posts
            end
            posts = posts.sum + User.find_by(id: page_type[:user_id]).posts
        else
            posts = User.find_by(id: page_type[:user_id]).posts
        end
        p posts
        render json: posts.to_json
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
    def page_type
        params.permit(:page_type, :user_id)
    end
end

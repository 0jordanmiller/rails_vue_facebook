class LandingController < ApplicationController
  def posts
    posts = Post.all
    render json: posts.to_json
  end
  def index
    
  end
end

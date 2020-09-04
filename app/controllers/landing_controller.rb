class LandingController < ApplicationController
  def index
    # gon.posts = Post.all
  end

  def posts
    posts = Post.all
    render json: posts.to_json
  end
end

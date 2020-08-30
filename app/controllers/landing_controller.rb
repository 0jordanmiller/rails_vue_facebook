class LandingController < ApplicationController
  def index
    gon.posts = Post.all
  end
  
  def example

  end
    
end

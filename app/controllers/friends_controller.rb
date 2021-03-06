class FriendsController < ApplicationController
  def index
    @friends = User.find(user_id[:user_id]).friends
    render json: @friends.to_json
  end

  def create
    User.find(requester[:user1]).befriend(User.find(requester[:user2]))
  end

  private

  def requester
    params.require(:befriend).permit(:user1, :user2)
  end

  def user_id
    params.permit(:user_id)
  end
end

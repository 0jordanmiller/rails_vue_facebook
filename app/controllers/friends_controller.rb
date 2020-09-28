class FriendsController < ApplicationController
    def index
        @friends = User.find_by(current_user).friends
    end

    def create
        User.find_by(id: requester[:user1]).befriend(User.find_by(id: requester[:user2]))
    end

    private

    def requester
        params.require(:befriend).permit(:user1, :user2)
    end

    def current_user
        params.permit(:user_id)
    end

end

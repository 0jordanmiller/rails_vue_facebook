class FriendRequestsController < ApplicationController
    def index
        friend_request = User.find_by(id).senders
        render json: friend_request.to_json
    end

    def destroy
        FriendRequest.find_by(sender_id: destroy_params[:user1], receiver_id: destroy_params[:user2]).destroy
    end

    private

    def id
        params.permit(:user_id)
    end

    def destroy_params
        params.permit(:user1, :user2)
    end
end

class FriendRequestsController < ApplicationController
    def index
        p user_id[:user_id]
        p "whoa"
        @friend_requests = User.find_by(id: user_id[:user_id]).received_from
        render json: @friend_requests.to_json
    end

    def show

    end

    def sent_to
        p 'hey'
        @friend_request_sent = User.find_by(id: user_id[:user_id]).sent_to
        render json: @friend_request_sent.to_json
    end

    def create
        if User.find_by(id: send_request[:sender]).sent_to.select {|user| user[:id] == send_request[:receiver]}.empty?
            User.find_by(id: send_request[:sender]).sent_to << User.find_by(id: send_request[:receiver])
        end
    end

    def destroy
        p 'whoa its joradn'
        p destroy_params
        FriendRequest.find_by(sender_id: destroy_params[:sender], receiver_id: destroy_params[:receiver]).delete
    end

    private
    def send_request
        params.require(:friend_request).permit(:sender, :receiver)
    end

    def user_id
        params.permit(:user_id)
    end

    def destroy_params
        params.permit(:receiver, :sender)
    end
end

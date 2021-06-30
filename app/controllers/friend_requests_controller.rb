class FriendRequestsController < ApplicationController
  def index
    @friend_requests = User.find(user_id[:user_id]).received_from
    render json: @friend_requests.to_json
  end

  def sent_to
    @friend_request_sent = User.find_by(user_id).sent_to
    render json: @friend_request_sent.to_json
  end

  def create
    if User.find(send_request[:sender]).sent_to.select { |user| user[:id] == send_request[:receiver] }.empty?
      User.find(send_request[:sender]).sent_to << User.find(send_request[:receiver])
    end
  end

  def destroy
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

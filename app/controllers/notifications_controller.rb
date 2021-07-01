class NotificationsController < ApplicationController
  def index
    p notif_index
    notification = User.find_by(notif_index).notifications.first(5)
    render json: notification.to_json
  end

  def create
    User.find_by(id: notify_post[:user_id]).notifications << Notification.create(notify_post)
  end

  private

  def notif_index
    params.permit(:id)
  end

  def notify_post
    params.require(:params).permit(:action, :sender, :user_id, :post_id, :unread)
  end
end

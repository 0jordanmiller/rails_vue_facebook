class UploadController < ApplicationController
  def upload_picture
    user = User.find_by(id: picture[:user_id])
    if picture[:type] == 'profile'
      user.profile_picture.attach(picture[:picture])
    else
      user.cover_picture.attach(picture[:picture])
    end
  end

  private

  def picture
    params.permit(:picture, :type, :user_id)
  end

  def admin_params
    params.permit(
      :picture
    )
  end
end

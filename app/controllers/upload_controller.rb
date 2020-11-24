class UploadController < ApplicationController
  def upload_picture
    if picture[:type] == 'profile'
      User.first.profile_picture.attach(picture[:picture])
    else
      User.first.cover_picture.attach(picture[:picture])
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

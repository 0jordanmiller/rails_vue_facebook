class UploadController < ApplicationController
  # def attach_main_pic(item)
  #   item.picture.attach(admin_params[:picture])
  # end

  # def upload_picture
  #   p 'abc'
  #   item = Upload.create item_params
  #   # Attach picture to our item, if available
  #   attach_main_pic(item) if admin_params[:picture].present?

  #   # Reply with success if the object was saved, or failure if it was not.
  #   if item.persisted?
  #     render json: item, status: 200
  #   else
  #     render json: item, status: 400
  #   end
  # end

  def upload_picture
    p 'heh'
    p picture
    User.first.profile_picture.attach(picture[:picture])
  end

  # def item_params
  #   {
  #     name: admin_params[:name],
  #     description: admin_params[:description]
  #   }
  # end

  private

  def picture
    params.permit(:picture)
  end

  def admin_params
    params.permit(
      :picture
    )
  end
end

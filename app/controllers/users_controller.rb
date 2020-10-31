class UsersController < ApplicationController
  def index
    @user = User.where.not(id: current_user[:user_id])
    render json: @user.to_json
  end

  private

  def current_user
    params.permit(:user_id)
  end
end

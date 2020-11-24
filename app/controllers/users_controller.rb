class UsersController < ApplicationController
  def index
    @user = User.where.not(id: user_id[:user_id])
    render json: @user.to_json
  end

  def show
    @user = User.find_by(id: user_id[:user_id])
    p @user
  end

  private

  def user_id
    params.permit(:user_id)
  end
end

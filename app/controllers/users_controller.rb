class UsersController < ApplicationController

  def index
    @user = User.where.not(id: current_user)
    if @user
      render json: @user.to_json
    end
  end

  def show
    user = User.find_by(id)
    hash = {}
    p 'tset'
    p user.profile_picture.attached?
    p current_user
    unless current_user.profile_picture.attached?
      hash[:profile_picture] = 'default.png'
      hash[:cover_picture] = 'default-cover.png'
    else
      hash[:profile_picture] = url_for(user.profile_picture)
      hash[:cover_picture] = url_for(user.cover_picture)
    end

    p 'tsettt'
    p hash
    render json: hash.to_json
  end

  private

  def user_id
    params.permit(:user_id)
  end

  def id
    params.permit(:id)
  end
end

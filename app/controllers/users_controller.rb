class UsersController < ApplicationController
  def create
    respond_with User.create(user_params)
  end

  private

  def user_params
    params.permit(:name, :device_token)
  end
end

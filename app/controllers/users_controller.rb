class UsersController < ApplicationController

  private

  def user
    @user ||= User.find_by_username(params[:username])
  end
  helper_method :user

end

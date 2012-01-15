class UsersController < ApplicationController

  def show
    @user = User.find_by_username(params['screen_name'])
    render_user
  end

end

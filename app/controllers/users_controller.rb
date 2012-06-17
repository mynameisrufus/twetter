class UsersController < ApplicationController

  def show
    @page = params[:page].nil? ? 1 : params[:page].to_i
    from = (@page - 1 ) * StatusesController::TWEETS_PER_PAGE
    to = StatusesController::TWEETS_PER_PAGE + from + 1
    params[:status] = "@#{user.username} "
    @tweets = user.public_tweets.offset(from).limit(to)
    @more_pages = (@tweets.length > StatusesController::TWEETS_PER_PAGE)
  end

  private

  def user
    @user ||= User.find_by_username(params[:username])
  end
  helper_method :user

end

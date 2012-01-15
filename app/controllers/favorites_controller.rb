class FavoritesController < ApplicationController
  def index
    @tweets = current_user.favorite_tweets
  end

  def create
    current_user.favorite_tweets << Tweet.find(params[:id])
    render nothing: true
  end

  def destroy
    current_user.favorite_tweets.find(params[:id]).destroy
    render nothing: true
  end
end

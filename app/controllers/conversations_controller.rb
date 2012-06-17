class ConversationsController < ApplicationController
  def related
    tweet = Tweet.find params[:id]
    @tweets = tweet.related
  end
end

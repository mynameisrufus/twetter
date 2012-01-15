class DirectMessagesController < ApplicationController
  def index
    @tweets = current_user.direct_messages_received.includes(:user).limit(25)
  end
  
  def sent
    @tweets = current_user.direct_messages_sent.includes(:user).limit(25)
  end    

  def create
    recipient = User.find(params[:user][:id])
    @tweet = Tweet.create({:tweet => params[:text], :user => @user, :recipient => recipient, :tweet_type => 'direct', :source => 'web'})
    redirect_to :action => 'sent'
  end
  
  def new
    recipient = User.find(params[:user])
    @tweet = Tweet.create({:tweet => params[:text], :user => @user, :recipient => recipient, :tweet_type => 'direct', :source => params[:source]})
    render_tweet
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    render :text => "OK"
  end
   
end

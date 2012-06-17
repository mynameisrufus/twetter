class StatusesController < ApplicationController
  # We don't want to protect search from forgery, cos, well, it's not that important
  protect_from_forgery except: :search

  def replies
    @tweets = Tweet.mentions(current_user).includes(:user).page(params[:page])
  end

  def public_timeline
    friends_timeline
  end

  def friends_timeline
    @tweets = Tweet.timeline.includes(:user).page(params[:page])
  end

  def search
    @tweets = []
    @keyword = params[:keyword].nil? ? '' : params[:keyword].strip

    if @keyword.length > 0
      conditions=['']
      key_conditions=[]

      # Run over each of our keywords and construct an array we'll use to
      # generate the SQL snippet.
      params[:keyword].split(/\s/).each do |term|
        key_conditions << 'tweets.tweet LIKE ?'
        conditions << "%#{term}%"
      end

      conditions[0] << "#{key_conditions.join(' AND ')}"

      @tweets = Tweet.timeline.includes(:user).where(conditions).page(params[:page])
    end
  end

  def statistics
    @top_ten_twats = Tweet.top_ten_updaters
    @twats_per_hour = Tweet.updates_per_hour
  end

  def user_timeline
    limit = params[:all] ? 100000000000 : 25
    @tweets = @user.tweets.timeline.all(:include => :user,:limit => limit)
  end
  
  def followers
    @users = @user.followers
  end
  
  def friends
    @users = @user.friends
    render_users
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = params[:status]
    type ='tweet'
    if tweet=~/^d (\S+) (.*)$/m
      type ='direct'
      recipient_name = $1
      tweet = $2
      recipient = User.fetch(recipient_name)
    elsif params['in_reply_to_status_id']
      type = "reply"
      in_reply_to_status = Tweet.find_by_id(params['in_reply_to_status_id'])
    end

    @tweet = Tweet.create(tweet: tweet, user_id: current_user.id, recipient: recipient, in_reply_to_status: in_reply_to_status, tweet_type: type, source: params[:source] || 'web')
    if params['twttr']
      latest_status = render_to_string partial: "latest", object: @tweet
      ret = {"status_count" => current_user.tweets.timeline.count, "latest_status" => latest_status, "text" => tweet}
      ret["status_li"] = render_to_string partial: "tweet", object: @tweet, locals: {type: 'friends_update'}
      render json: ret
    else
      render partial: 'statuses/tweet', locals: {tweet: @tweet, type: type}
    end
  end
end

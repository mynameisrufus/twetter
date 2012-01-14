# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all

  before_filter :show_params

  def show_params
    logger.info params.inspect
  end

  private

  def current_domain
    "http://#{request.host}"
  end
  helper_method :current_domain

  def login_via_oauth
    auth = request.headers['Authorization']
    if (auth)
      if (auth=~/^OAuth.*oauth_token="(\d+)-(.*?)"/)
        user_id = $1;
        crypted_password = $2;
        user = User.find_by_id(user_id)
        if (user && user.crypted_password == crypted_password)
          @current_user = user
        end  
      end
    end
  end

  def render_tweets(root="statuses")
    respond_to do |format|
      format.html { }
      format.atom { render :template => 'statuses/tweets' }
      format.xml { render :xml => @tweets.map(&:to_map).to_xml(:root=>root, :skip_types=>true, :dasherize=>false).gsub('direct_messages','direct-messages') }
      format.json { render :json => @tweets.map(&:to_map) }
    end
  end

  def render_users(root="users")
    respond_to do |format|
      format.html { }
      format.xml { render :xml => @users.map{|u| u.to_map(true)}.to_xml(:root=>root, :skip_types=>true, :dasherize=>false) }
      format.json { render :json => @users.map{|u| u.to_map(true) }}
    end
  end

  def render_user(root="user")
    respond_to do |format|
      format.html { }
      format.xml { render :xml => @user.to_map(true).to_xml(:root=>root, :skip_types=>true, :dasherize=>false) }
      format.json { render :json => @user.to_map(true) }
    end
  end

  def render_tweet(root="status")
    respond_to do |format|
      format.html { render :action => 'tweet' }
      format.xml { render :xml => @tweet.to_xml(:root=>root, :skip_types=>true, :dasherize=>false) }
      format.json { render :json => @tweet.to_map }
    end
  end

end

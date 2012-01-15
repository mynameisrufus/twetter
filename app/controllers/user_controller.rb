class UserController < ApplicationController

  def favourites
    @tweets = @duser.favorite_tweets
  end

  def friends
    @users = @duser.friends
    redirect_to(:controller=>'statuses', :action=>'friends') if (@user==@duser)
  end

  def followers
    @users = @duser.followers        
    redirect_to(:controller=>'statuses', :action=>'followers') if (@user==@duser)
  end

end

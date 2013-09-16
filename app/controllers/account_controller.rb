class AccountController < ApplicationController
  def index
    @tweets = @user.tweets.timeline
  end

  def end_session
    reset_session
    redirect_to :action=>'front'
  end

  def profile_image
    @duser = User.fetch(params[:id])
  end

  def update_profile_image
    upload_image(params[:image])
    redirect_to :action=>'index'
  end

  def verify_credentials
    render_user
  end

  def rate_limit_status
    rate_limit = {:reset_time_in_seconds=>1.hour.from_now.to_i, :remaining_hits=>100, :reset_time=>date_formatted(1.hour.from_now), :hourly_limit=>100}
    respond_to do |format|
      format.xml { render :xml => rate_limit.to_xml(:skip_types=>true)}
      format.json { render :json => rate_limit }
    end
  end

  def settings
    if (request.patch?)
      if (current_user.update_attributes(user_params))
        flash[:notice] = 'User attributes updated'
      end
    end
  end

  def picture
    if request.post?
      current_user.avatar = params[:image]
      current_user.save!
      flash[:notice] = "That's a pretty (ugly) photo!"
    end
  end

  private

  def date_formatted(date)
    date.gmtime.strftime("%a %b %d %H:%M:%S +0000 %Y")
  end

  def user_params
    params.require(:user).permit(:name, :username, :bio, :location)
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all

  private

  def _default_layout require_layout = false
    request.xhr? ? nil : 'application'
  end

end

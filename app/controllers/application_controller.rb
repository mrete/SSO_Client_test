class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from OAuth2::Error do |exception|
    if exception.response.status == 401
      session[:user_id] = nil
      session[:access_token] = nil
      redirect_to root_url, alert: "Access token expired, try signing in again."
    end
  end

  def get_user_information
    @user = access_token.get("/api/v1/get_user_information").parsed if access_token
    render json: @user.to_json
  end

private

  def oauth_client
    @oauth_client ||= OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], site: "http://localhost:3000")
  end

  def access_token
    if request.env['omniauth.auth']["credentials"]["token"]
      @access_token ||= OAuth2::AccessToken.new(oauth_client,request.env['omniauth.auth']["credentials"]["token"])
    end
  end

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user
end

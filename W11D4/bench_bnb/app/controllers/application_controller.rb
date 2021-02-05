class ApplicationController < ActionController::Base

  helper_method :logged_in?, :current_user

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: sessions[:session_token])
  end

  def require_logged_in
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.session_token
    @current_user = user
  end

  def logout!
    user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end
end

class ApplicationController < ActionController::Base


  def current_user
    @current_user = User.find_by(session_token: sessions[:session_token])
  ends

  def require_logged_in
    #
  end
end

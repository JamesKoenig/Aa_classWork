class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
                                    params[:user][:username],
                                    params[:user][:password]
                                    )
    if !user.nil?
      login(user)
      redirect_to user_url(user)
    else
      flash[:error] = ["Get Rekt, scrub."]
      render :new
    end
  end

  def destroy
    log_out
    redirect_to session_url
  end
end

class SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = "Invalid credentials. TRY AGAIN"
            redirect_to new_session_url
        end
    end

    def new
        @user = User.new
        render :new
    end

    def destroy
        logout
        redirect_to new_session_url
    end
end

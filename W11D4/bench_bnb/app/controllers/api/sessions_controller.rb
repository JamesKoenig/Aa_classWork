class Api::SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil?
            render json: ['Invalid credentials'], status: 401
        else
            login!(@user)
            render api_user_url(@user)
        end
    end

    def destroy
        if logged_in?
            logout!
            render json: {}
        else
            render json: ['Not logged in'], status: 404
        end
    end
end

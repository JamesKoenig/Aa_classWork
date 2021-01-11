class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:username], params[:password])
    if @user.save
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def index
    @users = User.all
    render :index
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      user.username = params[:user][:username]
      user.password = params[:user][:password]
      user.save
    end
    redirect_to user_url(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end

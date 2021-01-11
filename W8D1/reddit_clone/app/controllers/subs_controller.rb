class SubsController < ApplicationController
  before_action :require_logged_in, except: [:index, :show]
  
  def index
    @subs = Sub.all
    render :index
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      @sub.add_moderator(current_user)
      redirect_to sub_url(@sub)
    else
      
    end
  end

  def new
    @sub = Sub.new
    render :new
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end
  
  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub
      @sub.name     = params[:sub][:name]
      @sub.details  = params[:sub][:details]
      @sub.save
      redirect_to sub_url(@sub)
    end
  end
  
  def destroy
    @sub = Sub.find_by(id: params[:id])
    if @sub && current_user == @sub.moderators.first
      @sub.destroy
      redirect_to subs_url
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:name,:description)
  end
end

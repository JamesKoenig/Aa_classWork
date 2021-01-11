class SubsController < ApplicationController
  def index
    @subs = Sub.all
    render :index
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      
    end
  end

  def new
  end

  def edit
  end

  def show
  end
  
  def update
  end
  
  def destroy
  end

  private

  def sub_params
    params.require(:sub).permit(:name,:description)
  end
end

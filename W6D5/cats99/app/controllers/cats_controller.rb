class CatsController < ApplicationController
  def index
    kitty = Cat.all
    render :index

  end

  def show
    kitty = Cat.find(params[:id]
    render :show
  end

end
# :) talk to you over the weekend!
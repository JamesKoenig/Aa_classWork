class AlbumsController < ApplicationController
    def new
        @band= Band.find(params[:band_id])
        @album = Album.new(band_id: params[:band_id])
        render :new
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] =album.errors.full_messages
            render :new
        end
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def index
        @albums = Album.all
        render :index
    end

    def update
        album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    album = Album.find(params[:id])

    album.destroy

    redirect_to albums_url
  end

    private

    def user_params
        params.require(:album).permit(:title, :year, :band_id, :live)
    end
end

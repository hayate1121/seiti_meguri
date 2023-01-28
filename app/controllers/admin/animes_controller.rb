class Admin::AnimesController < ApplicationController
  def new
    @anime = Anime.new
  end
  
  def create
    anime = Anime.new(anime_params)
    anime.save
    redirect_to admin_anime_path(anime.id)
  end
  
  def show
    @anime = Anime.find(params[:id])
    @scenes = @anime.scenes
    @stores = Store.all
    if @scenes.present?
      @lat = 0
      @lng = 0
      @count = 0
      @scenes.each do |scene|
        @lat += scene.latitude
        @lng += scene.longitude
        @count += 1
      end
      @latitude = @lat/@count
      @longitude = @lng/@count
    end
  end
  
  def edit
    @anime = Anime.find(params[:id])
    @scenes = @anime.scenes
  end
  
  def update
    anime = Anime.find(params[:id])
    anime.update(anime_params)
    redirect_to admin_anime_path(anime.id)
  end
  
  def index
    @animes = params[:tag_id].present? ? Tag.find(params[:tag_id]).animes.order("title") : Anime.order("title").all
  end
  
  private
  
  def anime_params
    params.require(:anime).permit(:title, :spot, :anime_image, tag_ids: [])
  end
  
end

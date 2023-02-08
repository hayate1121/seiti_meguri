class Public::AnimesController < ApplicationController
  before_action :authenticate_user!
  def index
    @animes = params[:tag_id].present? ? Tag.find(params[:tag_id]).animes.order("title") : Anime.order("title").all
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
end

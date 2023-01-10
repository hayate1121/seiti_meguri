class Public::AnimesController < ApplicationController
  def index
    @animes = Anime.all
  end
  
  def show
    @anime = Anime.find(params[:id])
    @scenes = @anime.scenes
  end
end

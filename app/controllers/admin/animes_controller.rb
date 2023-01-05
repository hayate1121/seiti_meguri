class Admin::AnimesController < ApplicationController
  def new
    @anime = Anime.new
  end
  
  def create
    @anime = Anime.new(anime_params)
    @anime.save
    redirect_to root_path(@anime.id)
  end
  
  def show
    @anime = Anime.find(params[:id])
    @scenes = @anime.scenes
  end
  
  def edit
    @anime = Anime.find(params[:id])
    @scenes = @anime.scenes
  end
  
  def update
    @anime = Anime.find(params[:id])
    @anime.update(anime_params)
    redirect_to anime_path(@anime.id)
  end
  
  def index
    @animes = Anime.all
  end
  
  private
  
  def anime_params
    params.require(:anime).permit(:name, :spot)
  end
  
end

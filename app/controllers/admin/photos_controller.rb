class Admin::PhotosController < ApplicationController
  before_action :authenticate_admin!
  def show
    @photo = Photo.find(params[:id])
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def destroy
    photo = Photo.find(params[:id])
    anime = photo.anime
    photo.destroy
    redirect_to admin_scene_path(anime.id)
  end
  
  private
  
  def photo_params
    params.require(:photo).permit(:user_id, :anime_id, :scene_id, :address, :comment)
  end
  
end

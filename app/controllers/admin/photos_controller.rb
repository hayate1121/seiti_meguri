class Admin::PhotosController < ApplicationController
  def show
    @photo = Photo.find(params[:id])
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    photo = Photo.find(params[:id])
    photo.update(photo_params)
    redirect_to photo_path(photo.id)
  end
  
  private
  
  def photo_params
    params.require(:photo).permit(:user_id, :anime_id, :scene_id, :address, :comment)
  end
  
end

class Public::ScenesController < ApplicationController
  def show
    @scene = Scene.find(params[:id])
    @photo = Photo.new
    @photos = @scene.photos
  end
  
  private
  
  def photo_params
    params.require(:photo).permit(:user_id, :anime_id, :scene_id, :address, :comment, :image)
  end
end

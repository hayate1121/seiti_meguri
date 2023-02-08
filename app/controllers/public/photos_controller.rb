class Public::PhotosController < ApplicationController
  before_action :authenticate_user!
  def new
    @photo = Photo.new
  end
  
  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos
  end
  
  def show
    @photo = Photo.find(params[:id])
    @photo_comment = PhotoComment.new
  end
  
  def favorite
    @user = User.find(params[:user_id])
    favorites = Favorite.where(user_id: params[:user_id]).pluck(:photo_id)
    @photos = Photo.find(favorites)
  end
  
  def create
    photo = Photo.new(photo_params)
    photo.save
    redirect_to photo_path(photo.id)
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    photo = Photo.find(params[:id])
    photo.update(photo_params)
    redirect_to photo_path
  end
  
  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to photos_path
  end
  
  private
  
  def photo_params
    params.require(:photo).permit(:user_id, :anime_id, :scene_id, :address, :comment, :image)
  end
  
end

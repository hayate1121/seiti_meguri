class Admin::ScenesController < ApplicationController
  def new
    @scene = Scene.new
  end
  
  def create
    scene = Scene.new(scene_params)
    scene.save
    redirect_to admin_scene_path(scene.id)
  end
  
  def show
    @scene = Scene.find(params[:id])
    @photos = @scene.photos
  end
  
  def edit
    @scene = Scene.find(params[:id])
  end
  
  def update
    scene = Scene.find(params[:id])
    scene.update(scene_params)
    redirect_to admin_scene_path(scene.id)
  end
  
  private
  
  def scene_params
    params.require(:scene).permit(:scene_name, :anime_id)
  end
end

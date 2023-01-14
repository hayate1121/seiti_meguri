class Public::PhotoCommentsController < ApplicationController
  def create
    photo = Photo.find(params[:photo_id])
    reply = PhotoComment.new(photo_comment_params)
    reply.user_id = current_user.id
    reply.photo_id = photo.id
    reply.save
    redirect_to photo_path(photo.id)
  end
  
  def destroy
    PhotoComment.find(params[:id]).destroy
    redirect_to photo_path(params[:photo_id])
  end

  private

  def photo_comment_params
    params.require(:photo_comment).permit(:reply)
  end
end

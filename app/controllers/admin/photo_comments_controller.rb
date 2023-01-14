class Admin::PhotoCommentsController < ApplicationController
  def destroy
    PhotoComment.find(params[:id]).destroy
    redirect_to admin_photo_path(params[:photo_id])
  end
end

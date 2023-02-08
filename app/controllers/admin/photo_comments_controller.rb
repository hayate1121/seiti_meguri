class Admin::PhotoCommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    PhotoComment.find(params[:id]).destroy
    redirect_to admin_photo_path(params[:photo_id])
  end
end

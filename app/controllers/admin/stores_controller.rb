class Admin::StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
  end
  
  def index
    @stores = Store.all
  end
  
  def edit
    @store = Store.find(params[:id])
  end
  
  def update
    store = Store.find(params[:id])
    store.update(store_params)
    redirect_to admin_store_path
  end
  
  def destroy
    store = Store.find(params[:id])
    store.destroy
    redirect_to stores_path
  end
  
  private
  
  def store_params
    params.require(:store).permit(:store_name, :store_introduction, :email, :store_address, :latitude, :longitude)
  end
end

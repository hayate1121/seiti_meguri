class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post.id)
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @posts = Post.all
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:user_id, :anime_id, :scene_id, :address, :comment)
  end
  
end

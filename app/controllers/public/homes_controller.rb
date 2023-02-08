class Public::HomesController < ApplicationController
  def top
    @animes = Anime.limit(4).order("id DESC")
  end
  
  def about
  end
end

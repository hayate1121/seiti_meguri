class Admin::HomesController < ApplicationController
  def top
    @animes = Anime.all
  end
end

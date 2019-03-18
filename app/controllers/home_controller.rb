class HomeController < ApplicationController
  def index
    @fest = Fest.carousel
    
  end

  def show
    @music = MusicType.all
    @location = LocationType.all
    respond_to do |format|
      format.html {redirect_to home_index_path }
      format.js
    end
  end

end

class HomeController < ApplicationController
  def index
    @fest = Fest.carousel

  end

  def create    
    @music = MusicType.all
    @location = LocationType.all
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js 
    end
  end

end

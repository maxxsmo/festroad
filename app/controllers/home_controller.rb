class HomeController < ApplicationController
  def index
    @fest = Fest.carousel
    @music = MusicType.all
    @location = LocationType.all
  end

end

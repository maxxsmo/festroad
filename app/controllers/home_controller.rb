class HomeController < ApplicationController
  def index
    @fest = Fest.carousel
  end

end

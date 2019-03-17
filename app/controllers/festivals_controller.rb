class FestivalsController < ApplicationController
  def index
    @fest = Fest.all
    gon.fest = @fest
  end

  def show
    
  end
end

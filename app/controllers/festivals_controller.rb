class FestivalsController < ApplicationController
  def index 
    @fest = Fest.all  
  end

  def show
    @fest = Fest.find(params[:id])
  end
end

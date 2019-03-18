class FestivalsController < ApplicationController
  def index 
   @fests = Fest.title(params[:title]) if params[:title].present?   
    @fest = Fest.all
    gon.fest = @fest
  end

  def show
    
  end
end

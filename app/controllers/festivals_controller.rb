class FestivalsController < ApplicationController
  def index 
    @fests = Fest.where(nil)
    if params[:advanced]
      @fests = @fests.music(params[:music], @fests) if params[:music].present?
    else
      @fests = Fest.title(params[:title]) if params[:title].present?   
    end  
    @fest = Fest.all
    gon.fest = @fest
  end

  def show
    
  end
end

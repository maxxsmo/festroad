class FestivalsController < ApplicationController
  def index 
    @fests = Fest.where(nil)
    if params[:advanced]
      @fests = @fests.music(params[:music], @fests) if params[:music].present?
      @fests = Fest.location(params[:location], @fests) if params[:location].present?
      @fests = Fest.start_date(params[:start_date], @fests) if params[:start_date].present?
      @fests = Fest.end_date(params[:end_date], @fests) if params[:end_date].present?
    else
      @fests = Fest.title(params[:title]) if params[:title].present?   
    end  
    gon.fest = @fests
  end

  def show
    @fest = Fest.find(params[:id])
    respond_to do |format|
      format.html{
        redirect_to root_path
      }
      format.js{
      }
    end
  end


end

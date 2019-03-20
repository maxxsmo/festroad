class FestivalsController < ApplicationController

  def index 
    @fests = Fest.where(validation_admin: true)
    if params[:advanced]
      @fests = @fests.music(params[:music], @fests) if params[:music].present?
      @fests = Fest.location(params[:location], @fests) if params[:location].present?
      @fests = Fest.start_date(params[:start_date], @fests) if params[:start_date].present?
      @fests = Fest.end_date(params[:end_date], @fests) if params[:end_date].present?
    else
      @fests = Fest.title(params[:title]) if params[:title].present?   
    end  
    gon.fest = @fests
    @music = MusicType.all
    @location = LocationType.all
  end

  def show
    @fest = Fest.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  


end
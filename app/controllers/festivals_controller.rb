class FestivalsController < ApplicationController

  def index 
    @fests = Fest.where(validation_admin: true)
    @fests = Fest.title(params[:title]) if params[:title].present?  
    @fests = Fest.music(params[:music], @fests) if params[:music].present?
    @fests = Fest.location(params[:location], @fests) if params[:location].present?
    @fests = Fest.start_date(params[:start_date], @fests) if params[:start_date].present?
    @fests = Fest.end_date(params[:end_date], @fests) if params[:end_date].present?
    @carousel = Fest.carousel
    gon.fest = @fests
    @music = MusicType.all
    @location = LocationType.all
    @result = []
    if current_user
      wishlist = WishList.where(user: current_user).each {|w| @result << w.fest}
    end
  end

  def show
    @fest = Fest.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
    @result = []
    if current_user
      wishlist = WishList.where(user: current_user).each {|w| @result << w.fest}
    end
    @carousel = Fest.carousel 
  end
  


end
class FestivalsController < ApplicationController
  def index 
   @fests = Fest.title(params[:title]) if params[:title].present?   
  end

  def show
  end
end

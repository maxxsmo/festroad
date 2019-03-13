class FestivalsController < ApplicationController
  def index 
   @fests = Fest.all    
  end

  def show
  end
end

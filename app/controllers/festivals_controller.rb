class FestivalsController < ApplicationController
<<<<<<< HEAD
  def index
    @fest = Fest.all
    gon.fest = @fest
=======
  def index 
   @fests = Fest.all    
>>>>>>> development
  end

  def show
    
  end
end

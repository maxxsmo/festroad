module Admin
  class FestpicsController < ApplicationController
    
    def create
      @fest = Fest.find_by(id: params[:festival_id])
      puts @fest
      @fest.festpic.attach(params[:festpic])
      redirect_to admin_festivals_path
      flash[:success] = "La photo du festival a bien été modifiée"
    end

  end
end

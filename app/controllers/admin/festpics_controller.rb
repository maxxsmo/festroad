module Admin
  class FestpicsController < ApplicationController
    
    def create
      @fest = Fest.find_by(params[:fest_id])
      @fest.festpic.attach(params[:festpic])
      redirect_to(festivals_path(@fest))
    end

  end
end

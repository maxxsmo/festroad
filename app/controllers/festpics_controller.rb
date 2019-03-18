class FestpicsController < ApplicationController
  
  def create
    @fest = Fest.find(params[:fest_id])
    @fest.festpic.attach(params[:festpic])
    redirect_to(fest_path(@fest))
  end

  def update
    @fest = Fest.find(params[:fest_id])
    @fest.festpic.attach(params[:festpic])
    redirect_to(fest_path(@fest))
  end

end

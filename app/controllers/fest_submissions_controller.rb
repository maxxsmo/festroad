class FestSubmissionsController < ApplicationController

  def new 
    @fest = Fest.new
  end
  
  def create
    @fest = Fest.new(title: params[:title], description: params[:description], start_date: params[:start_date], end_date: params[:end_date], address: params[:address], website: params[:website])
    if @fest.save 
      flash[:success] = "Votre festival a bien été enregistré et sera soumis à validation."
      redirect_to festivals_path
    else 
      render "new"
    end
  end

end

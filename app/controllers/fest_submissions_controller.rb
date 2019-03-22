class FestSubmissionsController < ApplicationController

  def new 
    @fest = Fest.new
    @tag = Tag.new
    @fest_location = FestLocation.new
  end
  
  def create
    @fest = Fest.new(title: params[:title], description: params[:description], start_date: params[:start_date], end_date: params[:end_date], address: params[:address], website: params[:website])
    @tag = Tag.create(music_type_id: params[:music_types], fest: @fest)
    @fest_location = FestLocation.create(location_type_id: params[:location], fest: @fest)
    if @fest.save 
      flash[:success] = "Votre festival a bien été enregistré et sera soumis à validation."
      redirect_to festivals_path
      festsubmission_send
    else 
      render "new"
    end
  end

  def festsubmission_send
    AdminMailer.festsubmission_email(self).deliver_now
  end
end

module Admin
  
  class FestivalsController < ApplicationController

    before_action :set_fest, only: [:update, :edit, :destroy ]
    before_action :check_if_admin
    
    def index 
      @fests = Fest.where(nil)
      @fests = @fests.where(address: params[:address]) if params[:address].present?
      @fests = @fests.where(validation_admin: params[:validation]) if params[:validation].present?
      @fests = @fests.music(params[:music], @fests) if params[:music].present?
      @fests = @fests.title(params[:title]) if params[:title].present?
      @fests = Fest.location(params[:location], @fests) if params[:location].present?
      @music = MusicType.all
      @location = LocationType.all
    end

    def new 
      @fest = Fest.new
    end

    def create 
      @fest = Fest.new(title: params[:title], description: params[:description], start_date: params[:start_date], end_date: params[:end_date], address: params[:address], website: params[:website])
      if @fest.save 
        redirect_to({action: :index}, success: "Le festival a bien été créé")
      else 
        render "new"
      end
    end

    def edit 
      @fest = Fest.find(params[:id])
      @music = MusicType.all
      @location = LocationType.all
      @start_date = @fest.start_date.strftime('%Y-%m-%d')
      @end_date = @fest.end_date.strftime('%Y-%m-%d')

      @tag = Fest.find(params[:id]).tags
      result = []
      @music_type = @tag.each { |tag| result << tag.music_type.style}

      # @fest_location = FestLocation.find(params[:id])
      # @location = @fest_location.location_types

    end

    def update
      @fest = Fest.find(params[:id])
      if @fest.update(title: params[:title], description: params[:description], start_date: params[:start_date], end_date: params[:end_date], address: params[:address], website: params[:website], validation_admin: params[:validation_admin])
        Tag.create(music_type_id: params[:music_types], fest: @fest)
        FestLocation.create(location_type_id: params[:location], fest: @fest)
        redirect_to({action: :index}, success: "Le festival a bien été modifié")
      else 
        render "edit"
      end
    end

    def destroy
      @fest.destroy
      redirect_to({action: :index}, success: "Le festival a bien été supprimé")
    end

    private

    def set_fest
      @fest = Fest.find(params[:id])
    end

    def fest_params
      params.require(:fest).permit(:title, :description, :start_date, :end_date, :address, :website, :festpic)
    end

    def check_if_admin
      if current_user && current_user.is_admin == false
      redirect_to root_path
      end
    end

    
  end

end
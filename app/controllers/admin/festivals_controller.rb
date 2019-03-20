module Admin
  
  class FestivalsController < ApplicationController

    before_action :set_fest, only: [:update, :edit, :destroy ]
    before_action :check_if_admin
    
    def index 
      @fests = Fest.all
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
    end

    def update
      @fest = Fest.find(params[:id])
      if @fest.update(title: params[:title], description: params[:description], start_date: params[:start_date], end_date: params[:end_date], address: params[:address], website: params[:website], festpic: params[:festpic])
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
class FestivalsController < ApplicationController
  def index
    @fest = Fest.all
    gon.fest = @fest
  end

  def show
    @fest = Fest.find(params[:id])
    respond_to do |format|
      format.html{
        redirect_to root_path
      }
      format.js{
      }
    end
  end
end

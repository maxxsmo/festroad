class FestivalsController < ApplicationController
  def index
    @fest = Fest.all
    gon.fest = @fest
  end

  def show
    @fest = Fest.all
  end
end

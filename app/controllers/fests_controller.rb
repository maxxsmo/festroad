class FestsController < ApplicationController
  def index
    @products = Fest.title(params[:title]) if params[:title].present?
  end
end

class WishListsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy, :create]
  def index
    @wishlist = WishList.where(user: current_user)
    
  end

  def destroy
    @destroy = WishList.find(params[:id])
    @destroy.destroy
    respond_to do |format|
      format.html {redirect_to wish_lists_path}
      format.js
    end
  end


  def create
  @fest = Fest.find(params[:format])  
  @wishlist = WishList.create(user: current_user, fest: @fest)
  puts "créée"
  respond_to do |format|
    format.html {redirect_to '/festivals'}
    format.js
  end
  end 

end

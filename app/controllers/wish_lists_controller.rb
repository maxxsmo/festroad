class WishListsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy, :create]
  def index
    @wishlist = WishList.where(user: current_user)
    result = []
    fest = @wishlist.each {|f| result << f.fest}
    gon.fest = result
  end

  def create
    @fest = Fest.find(params[:format])  
    @wishlist = WishList.new(user: current_user, fest: @fest)
    if @wishlist.save
      flash[:success] = "Le festival a bien été ajoutée à votre liste de favoris"
      redirect_to festivals_path
    else 
      render 'new'
    end
  end 

  def destroy
    @favfest = WishList.find(params[:id])
    @favfest.destroy
    if @favfest.destroy
    flash[:danger] = "Le festival a été supprimé de votre liste"
    redirect_to wish_lists_path
    else 
      render 'new'
    end
  end

end

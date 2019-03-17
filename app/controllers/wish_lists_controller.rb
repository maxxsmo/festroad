class WishListsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]
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
end

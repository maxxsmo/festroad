class WishListsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]
  def index
    @wishlist = WishList.where(user: current_user)
  end

  def destroy
    
  end
end

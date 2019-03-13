class WishListsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @wishlist = WishList.where(user: current_user)
  end
end

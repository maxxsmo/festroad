class AdminController < ApplicationController

  def index
    @admins = User.where(is_admin: true)
    @fests = Fest.all
    @users = User.all
  end
  
end

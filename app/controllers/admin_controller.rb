class AdminController < ApplicationController

  before_action :check_if_admin

  def index
    @admins = User.where(is_admin: true)
    @fests = Fest.all
    @users = User.all
  end
  
end

private

  def check_if_admin
    if current_user && current_user.is_admin == false
    redirect_to root_path
    end
  end

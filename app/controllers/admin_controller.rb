class AdminController < ApplicationController
  before_action :is_admin?

  def index
    @admins = User.where(:all, :conditions => {:is_admin => true})
  end
  
end

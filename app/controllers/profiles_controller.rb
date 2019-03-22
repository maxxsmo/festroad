class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.friendly.find(current_user.id) 
  end
  
end

class AvatarsController < ApplicationController

  def create
      @user = User.find(current_user.id)
      @user.avatar.attach(params[:avatar])
      redirect_to(profile_path(current_user.id))
  end

end

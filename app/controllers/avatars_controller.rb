class AvatarsController < ApplicationController

  def create
      @user = User.find(current_user.id)
      @user.avatar.attach(params[:avatar])
      redirect_to(home_index_path(current_user.id))
  end

end

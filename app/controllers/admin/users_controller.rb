module Admin
  
  class UsersController < ApplicationController

    before_action :set_user, only: [:update, :edit, :destroy ]
    
    def index 
      @users = User.all
    end

    def new 
      @user = User.new
    end

    def create 
      @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], is_admin: params[:is_admin])
      if @user.save 
        redirect_to({action: :index}, success: "L'utilisateur a bien été créé")
      else 
        render "new"
      end
    end

    def edit 
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], is_admin: params[:is_admin])
        redirect_to({action: :index}, success: "L'utilisateur a bien été modifié")
      else 
        render "edit"
      end
    end

    def destroy
      @user.destroy
      redirect_to({action: :index}, success: "L'utilisateur a bien été supprimé")
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

  end

end
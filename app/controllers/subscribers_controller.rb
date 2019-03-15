class SubscribersController < ApplicationController
  def index
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      cookies[:saved_subscriber] = true 
      redirect_to root_path, notice: "Préférence sauvegardé."
    else 
      redirect_to root_path, notice: "Erreur de sauvegarde"
    end
  end

  private 

  def subscriber_params
    params.require(:subscriber).permit(:name)
  end
end

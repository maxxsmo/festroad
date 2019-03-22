class ContactController < ApplicationController
  def new
   @contact = Contact.new(params[:contact])
  end
    
 def create
  @contact = Contact.new(params[:contact])
  @contact.request = request
  if @contact.deliver
    flash.now[:error] = nil
    redirect_to root_path, notice: 'Message envoyé avec succès'
  else
    flash.now[:error] = "Le message ne s'est pas envoyé"
    render :new
  end
  end
  
end


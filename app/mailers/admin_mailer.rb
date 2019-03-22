class AdminMailer < ApplicationMailer
  default from: 'no-reply@festroad.fr'
   
  def festsubmission_email(result)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @result = []
    User.where(is_admin: true).each {|user| @result << user.email} 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://festroad.herokuapp.com/utilisateur/connexion'

    mail(to: @result, subject: "Quelqu'un a demandé à ajouter un Festival") 
  end
end

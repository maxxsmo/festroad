class UserMailer < ApplicationMailer
    default from: 'no-reply@festroad.fr'
   
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'https://festroad.herokuapp.com/utilisateur/connexion'

      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end
end


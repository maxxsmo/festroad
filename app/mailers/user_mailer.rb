class UserMailer < ApplicationMailer
    default from: 'no-reply@festroad.fr'
   
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'https://festroad.herokuapp.com/utilisateur/connexion'

      headers "X-SMTPAPI" => {
        filters:{
          templates: {
            settings: {
              enable: 1,
              template_id: 'd-3374fdb66c8042659d631a192c209ed6'
            }
          }
        }
      }.to_json
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end
end


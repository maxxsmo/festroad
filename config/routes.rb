Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :wish_lists, only: [:index, :destroy, :new, :create], :path => ("La-liste-des-favoris/fc9782394ze617&=!whislist")
  resources :home, only: [:index, :create], :path => "accueil"
  resources :kitui, only: [:index], :path => "kit-ui"
  resources :contact, only: [:new, :create], :path => "contacte-nous"
  resources :fest_submissions, only: [:new, :create], :path => "ajoute-un-festival"
  resources :festivals, only: [:index, :show], :path => ("La-carte-des-festivals/e3654974ze3&=France")
  root 'home#index'


  devise_for :users, :controllers => { registrations: 'registrations' }, path: "utilisateur", :path_names => {sign_in: "connexion",
                                 sign_out: "tu-nous-manques-déjà!", 
                                 edit: "mettre-à-jour-tes-informations-personnelles",
                                 password: 'secret-amigo',
                                 confirmation: 'verification', 
                                 registration: 'inscription',
                                 sign_up: 'rejoins-nous!',
                                 new: "nouveau"}
  
  resources :profiles, only: [:show], :path => "profil" do
    resources :avatars, only: [:create]
  end

  resources :admin, only: [:index]
  namespace :admin do
    resources :festivals do
      resources :festpics, only: [:create]
    end
    resources :users, only: [:index, :edit, :update, :destroy], path: "utilisateur"
  end

  resources :legal_mentions, only: [:index]

end

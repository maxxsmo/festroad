Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :wish_lists, only: [:index, :destroy, :new, :create], :path => ("La-liste-des-favoris/fc9782394ze617&=!whislist")
  resources :home, only: [:index], :path => "accueil"
  resources :kitui, only: [:index], :path => "page-kit-ui"
  resources :contact, only: [:new, :create], :path => "contacte-nous"
  resources :fest_submissions, only: [:new, :create], :path => "ajoute-un-festival"
  resources :festivals, only: [:index, :show], :path => ("La-carte-des-festivals/e3654974ze3&=France")
  root 'home#index'


  devise_for :users, :controllers => { registrations: 'registrations' }, path: "utilisateur", :path_names => {sign_in: "Bon-retour-parmis-nous-ami-festivalier",
                                 sign_out: "tu-nous-manques-déjà!", 
                                 edit: "ici-tu-peux-mettre-à-jours-tes-informations-personnelles",
                                 password: 'alors-ca-c-est-secret-amigo',
                                 confirmation: 'verification', 
                                 registration: 'connection',
                                 sign_up: 'YAYY-rejoins-nous!'}
  
  resources :profiles, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :admin, only: [:index]
  namespace :admin do
    resources :festivals do
      resources :festpics, only: [:create]
    end
    resources :users, only: [:index, :edit, :update, :destroy], path: "utilisateur"
  end

end

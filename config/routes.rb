Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :wish_lists, only: [:index, :destroy, :new, :create]
  resources :home, only: [:index, :create]
  resources :kitui, only: [:index]
  resources :contact, only: [:new, :create]
  resources :fest_submissions, only: [:new, :create]
  resources :festivals, only: [:index, :show]
  root 'home#index'


  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :profiles, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :admin, only: [:index]
  namespace :admin do
    resources :festivals do
      resources :festpics, only: [:create]
    end
    resources :users, only: [:index, :edit, :update, :destroy]
  end

  resources :legal_mentions, only: [:index]

end

Rails.application.routes.draw do
  get 'festivals/index'
  get 'festivals/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]
  resources :kitui, only: [:index]
  resources :contact, only: [:index]
  root 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }

end

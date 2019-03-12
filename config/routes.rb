Rails.application.routes.draw do
  root to: 'home#index'
  resources :home, only: [:index]
  resources :fests, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

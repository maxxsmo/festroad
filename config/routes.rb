Rails.application.routes.draw do
  get 'admin/index'
  get 'avatars/create'
  get 'festivals/index'
  get 'festivals/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :wish_lists, only: [:index]
  resources :home, only: [:index]
  resources :kitui, only: [:index]
  resources :contact, only: [:index]
  root 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :profiles do
    resources :avatars, only: [:create]
  end

  namespace :admin do
    resources :fests
    resources :users, only: [:index, :edit, :update, :destroy]
  end

end

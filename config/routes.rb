Rails.application.routes.draw do
  devise_for :users
  get '/profil', to: 'users#show', as: :profil
  resources :users, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'
  resources :appointments do
    collection do
    get 'me'
    end
  end
  resources :properties do
    resources :comments
  end
  get 'contact' => 'home#contact'
  resources :home, only: [:index, :new, :create]
  post 'guest', to: 'home#guest_user', as: 'guest_user'
  post 'admin', to: 'home#guest_admin', as: 'guest_admin'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

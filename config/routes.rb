Rails.application.routes.draw do

  resources :appointments do
    collection do
    get 'me'
    end
  end
  resources :properties do
    resources :comments
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  devise_for :users
  get '/profil', to: 'users#show', as: :profil
  resources :users, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'tops/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  post 'guest_sign_in', to: 'application#guest_sign_in'
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get 'follows'
      get 'followers'
      get 'like'
    end
  end
  namespace :admin do
    resources :users
  end

  resources :tops, only: [:index]
  root 'tops#index'
  post '/tops/guest_sign_in', to: 'application#guest_sign_in'
  post 'guest_admin_sign_in', to: 'application#guest_admin_sign_in'

  resources :relationships, only: [:create, :destroy]

  resources :labels

  resources :sakes do
    resources :comments, only: [:create]
  end
  
  get 'search', to: 'sakes#search'

  resources :comments, only: [:create]

  resources :favorites, only: [:index, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

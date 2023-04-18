Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
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

  resources :relationships, only: [:create, :destroy]

  resources :labels
  resources :sakes
  root 'sakes#index'
  get 'search', to: 'sakes#search'

  resources :favorites, only: [:index, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  namespace :api do
    get 'users/index'
    get 'users/show'
  end
  get 'users/show'
  get 'users/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'users/show'
  root "articles#index"
  get 'home' => 'articles#index'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  resources :users, :only => [:index, :show]

  resources :users do
    member do
      get :following, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end

  resources :articles do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  namespace :api do
    resources :users, only: [:index, :show]
  end
end

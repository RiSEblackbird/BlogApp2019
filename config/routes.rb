# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'users/index'
  get 'users/show'
  root 'articles#index'
  get 'home' => 'articles#index'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  post 'tags/:id/edit' => 'tags#edit'

  resources :users, only: %i[index show]

  resources :tags

  resources :users do
    member do
      get :following, :followers
    end
    resources :relationships, only: %i[create destroy]
  end

  resources :articles do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end
end

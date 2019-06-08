Rails.application.routes.draw do
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

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
end

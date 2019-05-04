Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  get 'users/show'
  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  resources :users, :only => [:index, :show]
end

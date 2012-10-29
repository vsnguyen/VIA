VIA::Application.routes.draw do
  
  # categories
  resources :categories, :only => [:index, :show] do
    resources :posts, :only => [:index, :show]
  end
  
  # posts
  resources :posts, :only => [:index, :show] do
    resources :comments, :only => [:show]
  end
  
  # comments
  resources :comments, :only => [:index]
  
  # users
  devise_for :users
  resources :users, :only => [:show]
  # resource :roles
  
  # admin
  namespace :admin do
    resources :categories
    resources :comments
    resources :posts
    resources :roles
    resources :users
  end  
  
  # home
  match "admin" => "admin/application#index"
  root :to => "homes#index"
end
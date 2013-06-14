Cookbook::Application.routes.draw do
  resources :sessions, :only => [:new, :create]
  match "logout" => "sessions#destroy", :as => "logout"
  match "login" => "sessions#new", :as => "login"

  resources :users, :only => [:new, :create]


  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :users

  resources :ingredients

  resources :comments

  resources :steps

  resources :categories

  get "recipes/index"

  get "recipes/new"
  post "recipes/create"

  get "recipes/edit/:id" => "recipes#edit", :as => :edit_recipe
  put "recipes/update:id" => 'recipes#update', :as => :update_recipe

  delete "recipes/destroy/:id" => 'recipes#destroy', :as => :delete_recipe

  get "recipes/:id" => "recipes#show", :as => :recipe

  root :to => 'recipes#index'

end
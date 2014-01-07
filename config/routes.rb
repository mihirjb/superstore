Storeapp::Application.routes.draw do

  get "comments/index"
  get "comments/new"
  get "comments/create"
  get "comments/show"
  get "comments/edit"
  get "comments/update"
  get "comments/destroy"
  get "profiles/index"
  get "profiles/new"
  get "profiles/create"
  get "profiles/show"
  get "profiles/edit"
  get "profiles/update"
  get "profiles/destroy"
  root :to => 'pages#home'
  get 'pages/about' => 'pages#about'
  get  'pages/help' => 'pages#help'
  get  'pages/dashboard' => 'pages#dashboard', :as => :dashboard
  
  resources :accounts
  resources :listings
  
  devise_for :vendors, :controllers => { :sessions => "sessions" }



end

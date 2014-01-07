Storeapp::Application.routes.draw do

  root :to => 'pages#home'
  get 'pages/about' => 'pages#about'
  get  'pages/help' => 'pages#help'
  get  'pages/dashboard' => 'pages#dashboard', :as => :dashboard
  
  resources :accounts
  resources :listings
  
  devise_for :vendors, :controllers => { :sessions => "sessions" }



end

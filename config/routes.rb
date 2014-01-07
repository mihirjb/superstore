Storeapp::Application.routes.draw do
  get "listings/index"
  get "listings/new"
  get "listings/create"
  get "listings/show"
  get "listings/edit"
  get "listings/update"
  get "listings/destroy"
  root :to => 'pages#home'
  get 'pages/about' => 'pages#about'
  get  'pages/help' => 'pages#help'
  get  'pages/dashboard' => 'pages#dashboard', :as => :dashboard
  
  resources :accounts
  
  devise_for :vendors, :controllers => { :sessions => "sessions" }



end

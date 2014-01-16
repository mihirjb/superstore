Storeapp::Application.routes.draw do


  devise_for :admins
  get "transactions/processtransaction"
  get "transactions/completetransaction"
  get "transactions/failedtransaction"
  get "transactions/notify_action"
  get "phones/index"
  get "phones/new"
  get "phones/create"
  get "index/new"
  get "index/create"
  root :to => 'pages#home'
  get 'pages/about' => 'pages#about'
  get  'pages/help' => 'pages#help'
  get  'pages/dashboard' => 'pages#dashboard', :as => :dashboard
  
  resources :accounts
  resources :listings
  resources :profiles
  resources :comments
  resources :reviews
  resources :phones
  
  
  devise_for :vendors, :controllers => { :sessions => "sessions" }



end

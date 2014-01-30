Storeapp::Application.routes.draw do

  get "adminactions/approvecomment"
  get "adminactions/approvelisting"
  get "adminactions/dashboard"
  
  devise_for :admins 
  get "transactions/processtransaction"
  get "transactions/completetransaction"
  get "transactions/failedtransaction"
  post "transactions/notify_action"  => 'transactions#notify_action'
  
  get "phones/index"
  get "phones/new"
  get "phones/create"
  get "pages/phones"
  
  get "index/new"
  get "index/create"
  root :to => 'pages#home'
  get 'pages/about' => 'pages#about'
  get  'pages/help' => 'pages#help'
  get  'pages/dashboard' => 'pages#dashboard', :as => :dashboard
  
  
  resources :comments
   resources :reviews
   resources :phones
  resources :accounts
  resources :listings
  resources :profiles do
     member do
        get :vote_for_profile
        get :vote_against_profile
        
     end
  end
  
 
  
  devise_for :vendors, :controllers => { :sessions => "sessions" } 



end

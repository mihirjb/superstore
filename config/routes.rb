Phoneclone::Application.routes.draw do


  get 'pointspayments/initiatepayment'
  post 'pointspayments/bronzeprocesspayment'
  post 'pointspayments/silverprocesspayment'
  post 'pointspayments/goldprocesspayment'
  get 'pointspayments/completedpayment'
  get 'pointspayments/failedpayment'
  post 'pointspayments/notify_action'   => 'pointspayments#notify_action'

  get "adminactions/deletelisting"
  get "adminactions/deletecomment"
  get "adminactions/modifylisting"
  get "adminactions/approvecomment"
  get "adminactions/approvelisting"
  get "adminactions/dashboard"
  get "adminactions/noimagesphones"
  
  get "transactions/initiatetransaction"
  get "transactions/codtransaction"
  post "transactions/codtransactioncomplete"
  get "transactions/codtransactionthanks"
  post "transactions/processtransaction"
  get "transactions/completetransaction"
  get "transactions/failedtransaction"
  post 'transactions/notify_action'  => 'transactions#notify_action'
  
  get "phones/index"
  get "phones/new"
  get "phones/create"
  get "pages/phones"
  get "pages/contact"
  get "pages/faq"
  get "pages/sellerfaq"
  get "pages/buyerfaq"
  get "pages/devicesfaq"
  get "pages/paymentsfaq"
  get "pages/terms"
  get "pages/listing"
  get "pages/buy"
  get "pages/sell"
  get "pages/searchresults"
  get 'pages/iphones-for-sale' => 'pages#alliphones'
  get 'pages/ipads-for-sale' => 'pages#allipads'
  get "pages/thanksandshare"
  get 'pages/verification-pictures' => 'pages#verificationpictures'
  
  
  
  get "index/new"
  get "index/create"
  root :to => 'pages#home'
  get 'pages/about' => 'pages#about'
  get  'pages/help' => 'pages#help'
  get  'pages/dashboard' => 'pages#dashboard', :as => :dashboard
  
  resources :trackcodes
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
  
 
  
  devise_for :admins
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" } 



end

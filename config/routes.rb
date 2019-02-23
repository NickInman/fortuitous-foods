Rails.application.routes.draw do
  root 'home#index' #Login/Signup Page
  get '/logout', to:'application#destroy' #Logout
  resources :home, only: [:index]

  resources :users
end

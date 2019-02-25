Rails.application.routes.draw do
  root 'home#index' #Login/Signup Page
  get '/login', to:'sessions#new' #get login info
  post '/login', to:'sessions#new' #post login info
  get '/logout', to:'sessions#destroy' #Logout
  get '/auth/facebook/callback', to: 'sessions#create_fb'

  resources :home, only: [:index]
  resources :sessions, only: [:create]
  resources :users
end

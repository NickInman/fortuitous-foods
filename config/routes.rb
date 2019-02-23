Rails.application.routes.draw do
  root 'home#index' #Login/Signup Page
  get '/login', to:'sessions#new' #get login info
  post '/login', to:'sessions#new' #post login info
  get '/logout', to:'sessions#destroy' #Logout
  resources :home, only: [:index]
  resources :sessions, only: [:create]
  resources :users
end

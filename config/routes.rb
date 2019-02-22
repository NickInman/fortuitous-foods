Rails.application.routes.draw do
  root 'home#index' #Login/Signup Page
  resources :home, only: [:index]

  resources :users
end

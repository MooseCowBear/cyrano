Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: [:new, :edit, :create, :update, :destroy]
  
  root "home#index"
end

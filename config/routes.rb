Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: [:new, :edit, :create, :update, :destroy, :show]
  resources :products

  root "home#index"
end

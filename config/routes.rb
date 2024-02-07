Rails.application.routes.draw do
  devise_for :users

  get "/dashboard", to: "dashboard#show"

  resources :profiles, only: [:new, :edit, :create, :update, :destroy, :show]
  resources :products

  root "home#index"
end

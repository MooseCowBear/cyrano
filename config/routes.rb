Rails.application.routes.draw do
  get "dashboard", to: "dashboard#show"
  devise_for :users

  resources :profiles, only: [:new, :edit, :create, :update, :destroy]

  root "home#index"
end

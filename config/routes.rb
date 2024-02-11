Rails.application.routes.draw do
  devise_for :users

  get "/dashboard", to: "dashboard#show"

  resources :profiles, only: [:new, :edit, :create, :update, :destroy, :show]
  resources :products, except: [:index]
  resources :writing_samples
  resources :writers, only: [:show, :index]

  resources :writers do
    resources :products, only: [:index]
  end

  root "home#index"
end

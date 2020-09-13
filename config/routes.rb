Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  root to: "orders#index"
  resources :items, only: [:new, :create, :update, :index, :show, :edit] 
  resources :orders, only:[:create]
end

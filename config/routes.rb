Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :messages , only: [:new,:create]
  end
  get 'items/category/:category_id' => 'items#category'
end

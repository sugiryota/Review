Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :messages , only: [:new,:create]
    
    collection do
      get 'search'
    end  
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  resources :users, only: :show
  get 'items/category/:category_id' => 'items#category'
end

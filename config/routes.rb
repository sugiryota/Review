Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :messages, only:  :create
    resource :likes, only: [:create, :destroy]

    collection do
      get :search, :comment_ranking
    end
    member do
      get :like_user
    end

  end

  resources :users, only: [:show, :index, :edit, :update, :destroy] do
    member do
      get :followings, :followers, :follow_review, :good_review
    end
  end
  get 'items/category/:category_id' => 'items#category'
  get 'ranking' => 'items#ranking'
  get 'pv_ranking' => 'items#pv_ranking'
  resources :relationships, only: [:create, :destroy]
  resources :notifications, only: [:index, :destroy]
end

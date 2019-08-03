Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  
  #items関係
  resources :items do
    resources :purchases, only: [:new, :create]
    resource :likes, only: [:create, :destroy]
    resources :messages, only: [:index, :create]
    resources :purchases, only: [:new, :create]
    member do
      get :seller
    end
    collection do
      get :set_children
      get :set_grandchildren
      get :brand
    end
  end

  #users関係
  resources :users, only: [:new, :create, :show, :edit, :update] do
    member do
      get :logout
      get :selling
    end
  end

  #credits関係
  resources :credits, only: [:new, :create]

  #devise関係
  resources :registrations, only: [:new, :create, :edit, :update] do
    collection do
      get :new1
      get :new2
      get :new3
      get :new4
      get :new5
      get :new6
    end
    collection do
      post :create1
      post :create2
      post :create3
      post :create4
      post :create5
      post :create6
    end
  end



  resources :sessions, only: [:new]
end

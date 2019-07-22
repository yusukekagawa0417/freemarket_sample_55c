Rails.application.routes.draw do
  root 'items#index'
  #items関係
  resources :items, only: [:index, :show, :new]

  namespace :purchace do
    resources :items, only: [:show]
  end

  #users関係
  resources :users, only: [:show, :edit]

  namespace :registration do
    resources :users, only: [:new]
  end

  namespace :session do
    resources :users, only: [:new]
  end

  namespace :logout do
    resources :users, only: [:new]
  end

  namespace :credit do
    resources :users, only: [:new]
  end

  namespace :confirmation do
    resources :users, only: [:show]
  end

end

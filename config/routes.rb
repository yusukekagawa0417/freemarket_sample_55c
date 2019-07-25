Rails.application.routes.draw do
  root 'items#index'
  #items関係
  resources :items, only: [:index, :show, :new]

  namespace :purchase do
    resources :items, only: [:show]
  end

  #users関係
  resources :users, only: [:show, :edit]

  namespace :registration do
    resources :users, only: [:new]
  end

  namespace :registration do
    resources :users do
      collection do
        get 'new_page1'
        get 'new_page2'
        get 'new_page3'
        get 'new_page4'
        get 'new_page5'
        get 'new_page6'
      end
    end
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

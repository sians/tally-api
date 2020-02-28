Rails.application.routes.draw do
  namespace :api, as: nil do
    devise_for :users, skip: :all
    devise_scope :user do
      post 'sign_in', to: 'sessions#create'
      delete 'sign_out', to: 'sessions#destroy'
      post 'reset_password', to: 'passwords#reset'
      patch 'password', to: 'passwords#update'
    end

    resources :users, only: [] do
      collection do
        get 'index'
        get 'me'
      end
    end

    get 'panels', to: 'panels#index'
    post 'panel', to: 'panels#create'
    patch 'panel', to: 'panels#update'

    # post 'colour_theme', to: 'colour_theme#create'
    # delete 'colour_theme', to: 'colour_theme#destroy'
    # patch 'colour_theme', to: 'colour_theme#update'

    resources :tasks, only: [:index, :create, :update, :destroy]
    resources :colour_themes, only: [:index, :create, :update, :destroy]
    resources :panels, only: [:index, :create, :update, :destroy]
    # get 'tasks', to: 'tasks#index'
    # post 'task', to: 'tasks#create'
    # delete 'task', to: 'tasks#destroy'


  end
end

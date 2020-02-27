Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    devise_for :users

    # resources :panels, only: [:index]
  end

  namespace :api, defaults: { format: :json } do
    get 'panels', to: 'panels#index'
    post 'panel', to: 'panels#create'
    patch 'panel', to: 'panels#update'

    post 'colour_theme', to: 'colour_theme#create'
    delete 'colour_theme', to: 'colour_theme#destroy'
    patch 'colour_theme', to: 'colour_theme#update'

    post 'task', to: 'tasks#create'
  end
end

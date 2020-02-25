Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    devise_for :users

    # resources :panels, only: [:index]
  end

  namespace :api, defaults: { format: :json } do
    get 'panels', to: 'panels#index'

  end

end

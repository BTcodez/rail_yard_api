Rails.application.routes.draw do
 resources :users, only: [:index, :create, :show, :update]
 resources :orders, only: [:index, :create, :show, :update]
 resources :raw_materials, only: [:index, :create, :show, :update]

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  post '/login', to: 'sessions#create'
end

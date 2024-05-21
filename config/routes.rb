Rails.application.routes.draw do
 resources :users
 resources :orders
 resources :raw_materials

 get "up" => "rails/health#show", as: :rails_health_check
 post '/login', to: 'sessions#create'
end

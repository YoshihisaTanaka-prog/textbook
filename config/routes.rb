Rails.application.routes.draw do
  resources :selections
  resources :mains
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "mains#index"
end

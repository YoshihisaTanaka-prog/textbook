Rails.application.routes.draw do
  get 'tops/top'
  get 'tops/non_auth'
  devise_for :teachers
  resources :solutions
  resources :subjects
  resources :selections
  resources :mains
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "mains#index"
end

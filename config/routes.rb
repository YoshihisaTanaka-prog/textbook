Rails.application.routes.draw do
  devise_for :teachers
  resources :solutions
  resources :subjects
  resources :selections
  resources :mains
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "non_auth", to: "tops#non_auth"
  post "api/teacher", to: "apis#teacher"
  post "api/solution", to: "apis#solution"
  post "solution_selections", to:"solution_selection#change_status"
  # Defines the root path route ("/")
  root "tops#top"
end

Rails.application.routes.draw do
  get 'admins/teacher', to: 'admins#teacher'
  get 'admins/teacher/:id', to: 'admins#teacher'
  post 'admins/teacher/:id', to: 'admins#allow_teacher'
  post 'admins/admin/:id', to: 'admins#allow_admin', as: "admins_admin"
  get 'admins/database', to: 'admins#database'
  get 'admins', to: 'admins#top'
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

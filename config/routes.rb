Rails.application.routes.draw do
  get 'homeworks/square_calculation', to: "homeworks#square_calculation"
  get 'homeworks/junior_factorization', to: "homeworks#junior_factorization"
  get 'homeworks/factorization', to: "homeworks#factorization"
  get 'homeworks/square_completed', to: "homeworks#square_completed"
  get 'homeworks', to: "homeworks#top"
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
  delete "solution_selection/:id", to:"solution_selection#delete", as: "solution_selection"
  # Defines the root path route ("/")
  root "tops#top"
end

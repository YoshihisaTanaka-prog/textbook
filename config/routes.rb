Rails.application.routes.draw do
  get "/words/no-session", to: "words#no_session"
  get "/words/mistake/:id", to: "words#mistake"
  get "/words/test", to: "words#test"
  resources :words
  resources :students
  resources :out_sites
  get 'training/square_calculation', to: "homeworks#square_calculation", as: "homeworks_square_calculation"
  get 'training/factorization', to: "homeworks#factorization", as: "homeworks_factorization"
  get 'training/square_completed', to: "homeworks#square_completed", as: "homeworks_square_completed"
  get 'training/fraction', to: "homeworks#fraction", as: "homeworks_fraction"
  post "set-training-session", to: "homeworks#set_session"
  get 'training', to: "homeworks#top", as: "homeworks"
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
  post "api/main", to: "apis#main"
  post "api/subject", to: "apis#subject"
  post "solution_selections", to:"solution_selection#change_status"
  delete "solution_selection/:id", to:"solution_selection#delete", as: "solution_selection"

  post "translate", to: "words#translate"
  post "prototype", to: "words#to_prototype"

  # Defines the root path route ("/")
  root "tops#top"
end

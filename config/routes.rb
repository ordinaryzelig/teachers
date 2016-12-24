Rails.application.routes.draw do
  root 'dashboard#index', :as => :dashboard

  resources :schools
  resources :comments
  resources :teacher_requests
  resources :users

  resources :teaching_positions, :only => [:show, :new, :create, :destroy]

  resources :sessions
end

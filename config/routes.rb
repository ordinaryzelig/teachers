Rails.application.routes.draw do
  root 'dashboard#index', :as => :dashboard

  resources :schools
  resources :comments
  resources :users

  resources :teaching_positions, :only => [:show, :new, :create, :destroy]
  resources :teacher_requests, :only => [:new, :create, :edit, :update]

  resources :teachers, :only => [] do
    resources :teacher_requests, :only => [:index, :show]
  end

  resources :sessions
end

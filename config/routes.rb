Rails.application.routes.draw do
  resources :teaching_positions
  resources :schools
  resources :comments
  resources :teacher_requests
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

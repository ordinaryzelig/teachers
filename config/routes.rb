Rails.application.routes.draw do
  root 'dashboard#index', :as => :dashboard

  resources :schools do
    collection do
      get 'search/:name', :action => 'search'
    end
  end
  resources :comments
  resources :users

  resources :teaching_positions, :only => [:show, :new, :create, :destroy]
  resources :teacher_requests, :only => [:new, :create, :edit, :update, :show] do
    member do
      patch :close
    end
  end

  resources :teachers, :only => [] do
    resources :teacher_requests, :only => [:index]
  end

  resources :sessions
end

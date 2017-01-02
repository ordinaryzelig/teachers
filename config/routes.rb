Rails.application.routes.draw do
  root 'dashboard#index', :as => :dashboard

  resources :schools do
    collection do
      get 'search/:name', :action => 'search'
    end
  end
  resources :comments
  resources :users, :only => [:show, :edit, :update] do
    resource :category, :only => [:edit] do
      post :teacher
      post :donor
    end
    resources :teacher_requests, :only => [:index]
  end

  resources :teaching_positions, :only => [:show, :new, :create]
  resources :teacher_requests, :only => [:new, :create, :edit, :update, :show] do
    member do
      patch :close
    end
  end

  resources :followships, :only => [:create]

  get '/auth/:provider/callback', to: 'sessions#create'
end

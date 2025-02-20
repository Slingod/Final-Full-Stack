Rails.application.routes.draw do
  get "pages/contact"
  root 'events#index'

  # Routes for events with registration and unregistration
  resources :events do
    member do
      post 'register'  # to register
      delete 'unregister'  # to unregister
      delete 'cancel'  # to cancel an event
    end
  end

  # Routes for users (signup, login, etc.)
  resources :users, only: [:show, :new, :create, :edit, :update, :index]

  # Routes for login and logout
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Routes for password management (if used)
  resources :passwords, only: [:new, :create, :edit, :update], param: :token

  # Routes for PWA (if used)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Route for contact page
  get 'contact', to: 'pages#contact'
  post 'contact', to: 'pages#submit_contact'
end

Rails.application.routes.draw do
  root 'events#index'

  # Routes pour les événements avec l'inscription et la désinscription
  resources :events do
    member do
      post 'register'  # pour s'inscrire
      delete 'unregister'  # pour se désinscrire
      delete 'cancel'  # pour annuler un événement
    end
  end

  # Routes pour les utilisateurs (inscription, connexion, etc.)
  resources :users, only: [:show, :new, :create, :edit, :update, :index]

  # Routes pour la connexion et la déconnexion
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Routes pour la gestion des mots de passe (si utilisée)
  resources :passwords, only: [:new, :create, :edit, :update], param: :token

  # Routes pour PWA (si utilisée)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end

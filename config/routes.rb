Rails.application.routes.draw do
  # Locale management
  get 'switch_locale/:locale', to: 'application#switch_locale', as: :switch_locale

  scope "(:locale)", locale: /fr|en/, defaults: { locale: "en" } do
    # Static pages
    get 'privacy-policy', to: 'static#privacy_policy', as: :privacy_policy
    get 'members', to: 'static#members', as: :members

    # Contact page
    get 'pages/contact'
    get 'contact', to: 'pages#contact'
    post 'contact', to: 'pages#submit_contact'

    # Homepage
    root 'events#index'

    # Event routes
    resources :events do
      member do
        post 'register'
        delete 'unregister'
        delete 'cancel'
      end
    end

    # User routes
    resources :users, only: [:show, :new, :create, :edit, :update, :index, :destroy]

    # Authentication
    get 'signup', to: 'users#new', as: 'signup'
    post 'signup', to: 'users#create'
    get 'login', to: 'sessions#new', as: 'login'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: 'logout'

    # Password management
    resources :passwords, only: [:new, :create, :edit, :update], param: :token

    # PWA routes
    get 'manifest' => 'rails/pwa#manifest', as: :pwa_manifest
    get 'service-worker' => 'rails/pwa#service_worker', as: :pwa_service_worker
  end
end
Rails.application.routes.draw do

  root 'sessions#index'

  get '/welcome', to: "static_pages#welcome", as: "welcome"
  get '/about', to: "static_pages#about", as: "about"
  get '/contact', to: "static_pages#contact", as: "contact"

  get '/stripe', to: "stripe#index", as: 'stripe'
  get '/stripe/authorize', to: "stripe#authorize"
  get '/stripe/oauth/callback', to: "stripe#oauth_callback"
  
  get '/webhooks', to: "hooks#redirect"
  post '/webhooks', to: "hooks#receiver"
  post '/ajax', to: "ajax#receiver", as: "ajax"

  get '/login', to: "sessions#login", as: 'login'
  get '/signup', to: "sessions#signup", as: 'signup'
  post '/login', to: "sessions#attempt_login"
  post '/signup', to: "sessions#create"
  get '/home', to: "sessions#index", as: 'home'
  delete '/logout', to: "sessions#logout", as: "logout"

  get 'overview' => 'overview#index'
  get 'finances' => 'finances#index'
  get 'settings' => 'settings#index'
  get 'users' => 'users#index'

  resources :users do
    resources :events, shallow: true
    resources :couples, shallow: true
    resources :assistants, shallow: true
    resources :packages, shallow: true
  end

  get 'assistants/:id/crop', to: 'assistants#crop_avatar', as: "assistants_crop_avatar"

  # get 'users/auth/:provider/callback', to: "billing#callback"
  resources :charges

  # Catch All - 404
  get '*a', to: 'errors#routing'
end

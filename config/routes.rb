Rails.application.routes.draw do

  get 'pages/index'

  namespace :site do
    resources :products
  end

  resources :entities, :people, :corporates, :categories, :products

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/', to: 'users/sessions#new'
    get 'sign_in', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
    get '/auth/:provider/callback' => 'users/registrations#facebook_create', as: :auth_callback
    get '/auth/failure' => 'users/sessions#facebook_failure', as: :auth_failure
  end
end

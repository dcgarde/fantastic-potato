require 'sidekiq/web'

Rails.application.routes.draw do
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  devise_for :users
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope controller: :static do
    get :pricing
  end
  
  resources :billings, only: :create

  namespace :purchase do
    resources :checkouts
  end

  get "success", to: "purchase/checkouts#success"

  resources :subscriptions

  resources :webhooks, only: :create


end

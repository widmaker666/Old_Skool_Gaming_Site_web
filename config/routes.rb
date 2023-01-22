Rails.application.routes.draw do
  resources :thecomments
  resources :comments, only: [:create, :destroy, :update]
  resources :articles do
    resources :images, only: [:create, :destroy]
  end
  resources :orders, only: [:new, :create]
  resources :user do
    resources :carts, only: [:index, :create, :destroy]
    resources :avatars, only: [:create, :destroy]
  end
  devise_for :users
  resources :modifications, only: [:update]
  root to: "articles#index"
  get '/old', to: 'static_pages#old_skool_gaming'
  get '/kit', to: 'static_pages#kit_ui'
  get '/cgv', to: 'static_pages#cgv'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

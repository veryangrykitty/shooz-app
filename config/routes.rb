Rails.application.routes.draw do
  get 'payment/create'
  get 'checkouts/new'
  get 'checkouts/create'
  # get 'listings/index'
  # get 'listings/create'
  # get 'listings/new'
  # get 'listings/edit'
  # get 'listings/show'
  # get 'listings/update'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :listings

  resources :checkout, only: [:new, :create]
  resources :payment, only: [:create]

  get '/seller/:id', to: "listings#seller_all", as: :seller
  get '/listings?search=:value', to: 'listings#search'
  get '/listings?category=:value', to: "listings#category"
end

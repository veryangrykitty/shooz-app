Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :listings

  resources :checkout, only: [:new, :create]
  resources :payment, only: [:create]

  get '/mylistings', to: "listings#seller_all"
  get '/listings?category=:value', to: "listings#category"
end

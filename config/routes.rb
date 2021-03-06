Rails.application.routes.draw do
  # get 'shippingdetails/create'
  # get 'payment/create'
  # get 'checkouts/new'
  # get 'checkouts/create'
  # get 'shippingdetails', to: "shippingdetails#new"

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
  # get '/listings?search=:value', to: 'listings#search'
  # get '/listings?category=:value', to: "listings#category"

  post '/listings/:id/checkout', to: 'checkouts#add_shipping_detail', as: :checkout_add_shippingdetail

  get '/listings/:id/checkout', to: 'checkouts#new', as: :checkout
  post '/listings/:id/checkout', to: 'checkouts#create', as: :checkout_create

  resources :shippingdetails, only: [:create, :destroy]
  resources :orders, only: [:index, :show, :create]

  get '/orders/:id/cancel', to: "orders#cancel", as: :order_cancel # check this route when free
  get '/seller/:id', to: "listings#seller_all", as: :seller
  get '/seller/:id/shipping', to: "listings#seller_ship", as: :seller_ship # to-be-shipped route

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ##Store Routes
  root 'store#home'
  get 'store/login', to: 'store#login'
  post 'store/logout', to: 'store#logout', as: 'logout'
  post 'store', to: 'store#check_login'
  
  
  resources :customers, only: [:new, :create]
  #Shopping Cart Routes
  resources :shopping_carts, only: [:show, :update, :check_cart]
  post 'shopping_carts/:id/check_cart', to: 'shopping_carts#check_cart'

  #Card Routes
  resources :cards, only: [:show]
  post 'cards/:id/add_to_cart', to: 'cards#add_to_cart'

  #Purchase Routes
  get 'shopping_carts/purchases/shipping', to: 'purchases#shipping', as: 'shipping'
  post 'shopping_carts/purchases/shipping', to: 'purchases#set_shipping', as: 'set_shipping'
  get 'shopping_carts/purchases/payment', to: 'purchases#payment', as: 'payment'
  post 'shopping_carts/purchases/set_payment', to: 'purchases#set_payment'
  get 'shopping_carts/purchases/shipping_methods', to: 'purchases#shipping_methods', as: 'shipping_methods'
  post "shopping_carts/purchases/set_shipping_method", to: 'purchases#set_shipping_method'
  get 'shopping_carts/purchases/review_purchase', to: 'purchases#review_purchase', as: 'review_purchase'
  post 'shopping_carts/purchases/confirm_checkout', to: 'purchases#confirm_checkout'
  get 'shopping_carts/purchases/confirmation_page', to: 'purchases#confirmation_page', as: 'confirmation_page'
end

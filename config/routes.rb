Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'store#home'
  get 'store/login', to: 'store#login'
  post 'store/logout', to: 'store#logout', as: 'logout'
  post 'store', to: 'store#check_login'
  resources :cards, only: [:show]
  resources :shopping_carts, only: [:show, :update]
  resources :customers, only: [:new, :create]

  post 'cards/:id/add_to_cart', to: 'cards#add_to_cart'
end

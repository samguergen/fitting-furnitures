Rails.application.routes.draw do
  root 'home#index'
  
  resources :comments
  resources :furnitures
  resources :users

  get 'home/index'
  get 'home/contact'
  get 'home/careers'
  get 'home/wishlist'
  get 'home/settings'
  get 'home/lottery'
  get 'home/lottery_gamble'
  get 'home/error'
  get 'home/wishlist'
  get '/by_category' => 'furnitures#by_category'
  

  delete '/logout' => 'sessions#logout'
  post '/login' => 'sessions#login'
  post '/signup' => 'sessions#signup'
  post '/purchase' => 'furnitures#purchase'
  post '/trade' => 'furnitures#trade'
  post '/add_wishlist' => 'home#add_wishlist'

  get 'furnitures/wishlist'
  get 'home/wish'

end

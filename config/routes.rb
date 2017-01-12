Rails.application.routes.draw do
  resources :comments
  get 'home/index'
  get 'home/contact'
  get 'home/careers'
  get 'home/wishlist'
  get 'home/settings'
  get 'home/error'

  resources :furnitures
  resources :users

  post '/signup' => 'sessions#signup'
  
  root 'home#index'

  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'

  get '/by_category' => 'furnitures#by_category'

  post '/purchase' => 'furnitures#purchase'

  post '/trade' => 'furnitures#trade'

  post '/wishlist' => 'furnitures#wishlist'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

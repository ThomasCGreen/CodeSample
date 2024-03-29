Ecarei::Application.routes.draw do
  # The priority is based upon order of creation:
  #   first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root to: 'welcome#index'

  resources :users,
            only: [:new, :create],
            path_names: { new: 'signup' }

  get '/login',
      to: 'sessions#login',
      as: 'login'

  post '/login',
       to: 'sessions#create'

  delete '/logout',
         to: 'sessions#destroy'

  get '/display',
      to: 'displays#main'

  resources :categories do
    resources :categories,
              only: [:new, :create]
    resources :businesses,
              only: [:new, :create]
  end

  get '/categories/:category_id/businesses/show',
      to: 'businesses#show', as: :show_businesses

  resources :businesses,
    only: [:new, :create]

  resources :business do
    resources :reviews,
              only: [:new, :create]
  end

  get '/businesses/:business_id/reviews/show',
      to: 'reviews#show', as: :show_reviews

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with
  # purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions
  # automatically):
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

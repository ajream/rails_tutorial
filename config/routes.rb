RailsTutorial::Application.routes.draw do
  resources :users do
    member do # member 方法作用是，设置这两个动作对应的 URI 地址中应该包含用户的 id。
      get :following, :followers
    end
  end

  resources :sessions, only: [:new, :create, :destroy] # 为 resources 方法指定了 :only 选项，只创建 new、create 和 destroy 动作。

  resources :microposts, only: [:create, :destroy]
  
  resources :relationships, only: [:create, :destroy]
  
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete # 这个参数指明 destroy 动作要使用 DELETE 请求

  # get "static_pages/home" # 定义具名路由:
  # match '/home', to: 'static_pages#home' # match '/home' 会自动创建具名路由函数
  # home_path => '/home'
  # home_url  => 'http://localhost:3000/home'
  root to: 'static_pages#home'
  
  # get "static_pages/help"
  match '/help', to: 'static_pages#help'

  # get "/static_pages/about"
  match '/about', to: 'static_pages#about'

  # get "static_pages/contact"
  match '/contact', to: 'static_pages#contact'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

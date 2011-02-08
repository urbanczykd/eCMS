ECMS::Application.routes.draw do
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
  resources :user_sessions, :only =>[:new, :create, :destroy]
  resources :users, :only => [:new, :create, :show]
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
  match "admin", :to => "Admin#index", :as => "admin"      
  match "login", :to => "User_sessions#new", :as => "login"
	match "logout", :to => "User_sessions#destroy", :as => "logout"
  match "register", :to => "Users#new", :as => "register"
   namespace :admin do
      post 'upload_media' => "Mmanagers#upload_media", :as => "upload_media"
#      get 'place' => "Mmanagers#place", :as => "place"
      resources :mmanagers do
        get 'place', :on => :collection
        post 'create_directory', :on => :collection
        get 'show_file', :on => :collection
        get 'del_file', :on => :collection
        get 'del_dir', :on => :collection

      end
    resources :newsletters
    resources :users
    resources :articles do
      get "act(/:art_act)", :to => "Articles#act", :as => "act"
    end
    resources :galleries do
      resources :images
    end
   end
##
  
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
#  resources :articles
   match ':id' => "Articles#show", :as => "article"
##
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

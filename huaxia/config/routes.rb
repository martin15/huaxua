Huaxia::Application.routes.draw do


  mount Ckeditor::Engine => '/ckeditor'

  resources :about_us, :only => [:index]
  resources :testimonials, :only => [:index, :show]
  get "info/:permalink" => "info_study#index", :as => "info"
  get "hsk" => "hsk#index", :as => "hsk"
  get "learning_mandarin" => "learning_mandarin#index", :as => "learning_mandarin"
  get "galleries" => "galleries#index", :as => "categories"
  get "gallery/:permalink" => "galleries#show", :as => "category"
  get "university/:permalink" => "universities#show", :as => "university"
  get "books" => "books#index", :as => "books"
  get "book/:permalink" => "books#show", :as => "book"

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions, :only => [:create]

  match "admin" => "admin/dashboard#index", :as => "admin"
  post "admin/dashboard/change_password"

  namespace :admin do
    resources :universities
    resources :books
    resources :informations
    resources :banners
    resources :features
    resources :testimonials
    get "gallery_categories" => "categories#index", :as => "gallery_categories"
    get "gallery_categories/new" => "categories#new", :as => "new_gallery_categories"
    post "gallery_categories" => "categories#create", :as => "gallery_categories"
    get "gallery_categories/:id/edit" => "categories#edit", :as => "edit_gallery_categories"
    put "gallery_categories/:id/edit" => "categories#update", :as => "update_gallery_categories"
    delete "gallery_categories/:id" => "categories#destroy", :as => "delete_gallery_categories"

    get ":category_id/galleries" => "galleries#index", :as => "galleries"
    post ":category_id/galleries" => "galleries#create", :as => "galleries"
    get ":category_id/galleries/new" => "galleries#new", :as => "new_gallery"
    get ":category_id/galleries/:id/edit" => "galleries#edit", :as => "edit_gallery"
    get ":category_id/galleries/:id" => "galleries#show", :as => "gallery"
    put ":category_id/galleries/:id" => "galleries#update", :as => "gallery"
    delete ":category_id/galleries/:id" => "galleries#destroy", :as => "gallery"
  end

  root :to => 'home#index'

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

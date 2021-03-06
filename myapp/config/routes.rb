ActionController::Routing::Routes.draw do |map|
  map.resources :centricsteels

  map.resources :specifications
  map.resources :stoppages
  map.resources :addresses
  map.resources :clients
  map.resources :clients
  map.resources :suppliers
  map.resources :deliverychallans
  map.resources :taxinvoices
  map.resources :predespatchtcs
  map.resources :uncoiler_reports
  map.resources :tube_mill_performance_reports , :member => {:production_detail => :get}
  map.tube_mill_production 'tube_mill_production', :controller => 'tube_mill_performance_reports', :action => 'production_index'
  map.wide_coil 'tube_stock', :controller => 'tube_mill_performance_reports', :action => 'tube_stock'  
  map.resources :tube_mill_stoppage_reports
  map.resources :slittingproductions
  map.wide_coil 'slit_coil', :controller => 'slittingproductions', :action => 'slit_coil'  
  map.resources :slittings  
  map.resources :roles
  map.resources :employees
  map.resources :departments
  map.resources :rawmaterials
  map.wide_coil 'wide_coil', :controller => 'rawmaterials', :action => 'wide_coil'
  map.resources :rawmaterial_categories
  map.resources :salesplans
  map.resources :customer_orders , :collection => {:customer_detail => :get}
  map.resources :serializes
  map.resources :customers,:member=>"customer_report"  
  map.resource :user_session
  map.root :controller => "rawmaterials", :action => "index" # optional, this just sets the root route
  map.resources :users, :member => {:reset_password => :get,:update_password => :post}
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout  "logout",  :controller => "user_sessions", :action => "destroy"
  map.connect 'report/raw_mat', :controller => 'reports', :action => 'raw_rpt'
  map.connect 'report/slitting_rpt', :controller => 'reports', :action => 'slitting_rpt'
  map.connect 'report/slitting_production_rpt', :controller => 'reports', :action => 'slitting_production_rpt'
  map.connect 'report/uncoil_rpt', :controller => 'reports', :action => 'uncol_rpt'
  map.connect 'report/taxinvoice_new', :controller => 'reports', :action => 'taxinvoice_new'
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end
  #centric
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

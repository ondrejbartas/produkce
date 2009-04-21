ActionController::Routing::Routes.draw do |map|
  map.resources :system_comments, :has_many => [ :system_comments ],
                                  :member => [:add_form, :finished ]



 

  
  
    
  map.with_options :controller => 'account' do |m|
    m.login   'login',     :action => 'login'
    m.logout  'logout',    :action => 'logout'
    m.menu_home 'menu_home',   :action => 'menu_home'
    m.menu_contact 'menu_contact',   :action => 'menu_contact'
    m.menu_plan    'menu_plan',      :action => 'menu_plan'
    m.menu_project 'menu_project',   :action => 'menu_project'
    m.menu_accountant 'menu_accountant',   :action => 'menu_accountant'
    m.menu_admin 'menu_admin',   :action => 'menu_admin'
    m.menu_work 'menu_work',   :action => 'menu_work'
    m.menu_purchase 'menu_purchase',   :action => 'menu_purchase'
  end


  map.resources :plans, :collection => { 
              :week => [:get, :post] , 
              :change_place_date => [:get, :post] , 
              :change_reservation => [:get, :post] , 
              :delete_work => [:get, :post] , 
              :month => [:get, :post], 
              :add_week_calendar => [:get, :post],
              :add_date => [:get, :post],
              :add_calendar_work => [:get, :post]  }
              

  map.resources :users, :collection => { :change_atributes => [:get, :post]}

 # map.connect 'view/:action', :controller => 'users', :action => { 'client', 'worker' }

 #map.correct 'works/:id/correct', :controller => 'works', :action => 'correct'
 #map.edit_planned 'works/:id/edit_planned', :controller => 'works', :action => 'edit_planned'

 # map.resources :works, :collection => { :check => [:get, :post], :non_assigned => [:get, :post],
 #                                        :render_index => [:get, :post]  , :new_plan => [:get, :post] ,
 #                                        :add_place => [:get, :post], :add_operation => [:get, :post] ,
 #                                        :add_operation_type_parameters => [:get, :post],
 #                                        :planned =>[:get, :post] }
  #map.resources :projects do |project|
  #   project.resources :works, :collection => [:new_plan]
  #end

  map.resources :contacts, :collection => { :render_index => [:get, :post] }
 
  map.resources :projects, :collection => { 
                :render_sub_project => [:get, :post] , 
                :render_project => [:get, :post] }


  

  #map.resources :plan_works, :member => { 
  #        :edit_without_project => [:get, :post] }, 
  #        :collection => {:index_without_project => [:get, :post], 
  #        :add_place_finished_operation => [:get, :post], 
  #        :add_operation_type_parameters => [:get, :post], 
  #        :new_without_produce => [:get, :post] , 
  #        :new_now => [:get, :post], 
  #        :add_user_operation => [:get, :post], 
  #        :add_user => [:get, :post], 
  #        :add_operation => [:get, :post],  
  #        :add_finished_operation => [:get, :post], 
  #        :add_calendar => [:get, :post], 
  #        :add_edit_calendar => [:get, :post], 
  #        :add_date => [:get, :post]  }
   
  map.resources :projects, :has_many => [ :projects, :invoices]

  map.resources :projects do |project|
     project.resources :works, :collection => { :new_now => [:get, :post] }
  end

  map.resources :works, :has_many => [:operations],
                        :collection => { :add_operation => [:get, :post],
                                    :add_user => [:get, :post] },
                        :member => { :add_operation_from_worker => [:get, :post] 
                        }

  map.resources :users, :has_many => [:contacts, :works]

  map.resources :companies, :has_many => [:projects, :contacts, :users ]

  map.resources :companies
  map.resources :works
  map.resources :histories
  map.resources :job_types
  map.resources :places
  map.resources :comments
  map.resources :contacts
  map.resources :roles
  map.resources :warehouse_controls, :collection => { 
                      :show_discarded_tapes => [:get, :post],
                      :show_sold_tapes=> [:get, :post]}
  map.resources :purchase_carts
  map.resources :bought_tapes
  map.resources :operation_types
  map.resources :invoice_operations
  map.resources :invoices, :collection => { 
                      :finished_projects => [:get, :post] }
  map.resources :tape_types
  map.resources :machines
  map.resources :operations, :collection => { :add_operation_type_parameters => [:get, :post] }
  map.resources :categories

  map.resources :finished_works


   map.resources :rights

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

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.


  map.root :controller => 'account', :action => "login"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'


end

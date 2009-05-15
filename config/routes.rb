ActionController::Routing::Routes.draw do |map|
  map.resources :project_paths


  map.resources :comments


  map.resources :tape_sells

  map.resources :update_logs

  map.resources :reception_categories

   
  map.with_options :controller => 'account' do |m|
    m.login   'login',     :action => 'login'
    m.logout  'logout',    :action => 'logout'
    m.menu_home 'menu_home',   :action => 'menu_home'
    m.menu_contact 'menu_contact',   :action => 'menu_contact'
    m.menu_plan    'menu_plan',      :action => 'menu_plan'
    m.menu_project 'menu_project',   :action => 'menu_project'
    m.menu_accountant 'menu_accountant',   :action => 'menu_accountant'
    m.menu_admin 'menu_admin',   :action => 'menu_admin'
    m.menu_stats 'menu_stats',   :action => 'menu_stats'
    m.menu_work 'menu_work',   :action => 'menu_work'
    m.menu_work 'menu_reception',   :action => 'menu_reception'
    m.menu_purchase 'menu_purchase',   :action => 'menu_purchase'
  end


  map.resources :reception_events

  map.resources :reception_contacts

  map.resources :operator_plans, :collection => {:add_new_user_plan => [:get, :post], :index_recepce => [:get, :post], :new_recepce => [:get, :post]}
 
  map.resources :system_comments, :has_many => [ :system_comments ],
                                  :member => [:add_form, :finished, :storno, :archiv ]
  map.resources :workflow_comments, :has_many => [ :system_comments ],
                                     :member => [:add_form, :finished, :storno, :archiv ]

  map.resources :contacts, :collection => { :render_index => [:get, :post] }

  map.resources :plans, :collection => { 
              :week => [:get, :post] , 
              :change_place_date => [:get, :post] , 
              :change_reservation => [:get, :post] , 
              :delete_work => [:get, :post] , 
              :month => [:get, :post], 
              :add_week_calendar => [:get, :post],
              :add_date => [:get, :post],
              :add_calendar_work => [:get, :post]  }
              

 
  map.resources :projects, :collection => { 
                :list => [:get, :post] , 
                :works_fuse => [:get, :post] , 
                :works_fuse_from => [:get, :post] , 
                :works_fuse_to => [:get, :post] , 
                :render_sub_project => [:get, :post] , 
                :render_sub_project_sell => [:get, :post] , 
                :render_project => [:get, :post] }, 
                :has_many => [ :projects, :invoices]

  map.resources :projects do |project|
     project.resources :works, :collection => { :new_now => [:get, :post] }
  end

  map.resources :works, :has_many => [:operations],
                        :collection => { 
                                    :change_project => [:get, :post],
                                    :add_operation => [:get, :post],
                                    :add_user => [:get, :post],
                                    :new_now => [:get, :post] ,
                                    :new_without_produce => [:get, :post],
                                    :add_place_finished_operation => [:get, :post] },
                              :member => { :add_operation_from_worker => [:get, :post] 
                        }

  map.resources :users, :has_many => [:contacts, :works, :system_comments, :workflow_comments, :finished_works],
                        :member => {:change_role => [:get, :post] },
                        :collection => { :list => [:get, :post] , 
                        :change_atributes => [:get, :post]}

  map.resources :companies, :has_many => [:projects, :contacts, :users ],
                            :collection =>{ :list => [:get, :post]}
  map.resources :works
  map.resources :histories
  map.resources :job_types
  map.resources :places 
  map.resources :roles
  map.resources :warehouse_controls, :collection => { 
                      :show_discarded_tapes => [:get, :post],
                      :show_used_tapes => [:get, :post],
                      :show_sold_tapes=> [:get, :post]}
  map.resources :purchase_carts
  map.resources :bought_tapes
  map.resources :operation_types
  map.resources :invoice_operations
  map.resources :invoices, :collection => { 
                      :finished_projects => [:get, :post] }
  map.resources :tape_types, :collection => { :render_price => [:get, :post] }
  map.resources :machines
  map.resources :operations, :collection => { :add_operation_type_parameters => [:get, :post] }
  map.resources :categories
  map.resources :finished_works, :member => {:change_value => [:get, :post], :correct => [:get, :post]  }
  map.resources :rights

  map.root :controller => 'account', :action => "login"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'


end

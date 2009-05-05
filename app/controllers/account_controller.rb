class AccountController < ApplicationController

  def login
    if request.post?
      @current_user = User.authenticate(params['user']['login'],
                                        params['user']['password'])
        if @current_user
          if @current_user.access == false
           flash[:error] = 'nemáte přístup do systému'
           redirect_to login_url
          else
           @activePage = "menu_home"
           session[:lastLogin] = Time.now
           session[:activePage] = @activePage
           session[:user_id] = @current_user.id
           redirect_to menu_home_path
         end
      else
        flash[:error] = 'Špatná kombinace jména a hesla'
        redirect_to login_url
      end

    end
  end

  def logout
    reset_session
    flash[:info] = 'Odhlášeno'
    redirect_to login_url
  end

  def menu_contact
    session[:activePage] = "menu_contact"
    @activePage = session[:activePage]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  def menu_stats
    session[:activePage] = "menu_stats"
    @activePage = session[:activePage]
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
   def menu_home
    session[:activePage] = "menu_home"
    @activePage = session[:activePage]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

   def menu_reception
    session[:activePage] = "menu_reception"
    @activePage = session[:activePage]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end


  def menu_purchase
    session[:activePage] = "menu_purchase"

    @tape_types = TapeType.find(:all).sort_by {|u| u.order}
    
    @activePage = session[:activePage]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

   def menu_plan
    session[:activePage] = "menu_plan"
    @activePage = session[:activePage]
    
    
    redirect_to(:controller=>"plans", :action => "week")
  end

    def menu_project
      session[:activePage] = "menu_project"
      @activePage = session[:activePage]
      
      redirect_to ( :controller => "projects",:action => "list")
     
  end

   def menu_accountant
    session[:activePage] = "menu_accountant"
    @activePage = session[:activePage]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  def menu_admin
    session[:activePage] = "menu_admin"
    @activePage = session[:activePage]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  def menu_work
    session[:activePage] = "menu_work"
    @activePage = session[:activePage]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

end

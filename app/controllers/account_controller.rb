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
    @finished_work = FinishedWork.new
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
      
       if params[:filter].blank? 
           @filter = { "0" => "true", "1" => "true" }
        else
           @filter = params[:filter]
        end

        if params[:search_for].blank? 
           @search_for = ""
           @search_for_text =""
        else
           @search_for = params[:search_for]
           @search_for_text = " AND ( LOWER(companies.name) LIKE '%"+@search_for.downcase+"%' OR "
           @search_for_text += "LOWER(projects.note) LIKE '%"+@search_for.downcase+"%' OR "
           @search_for_text += "LOWER(users.name) LIKE '%"+@search_for.downcase+"%' OR "
           @search_for_text += "LOWER(projects.name) LIKE '%"+@search_for.downcase+"%' OR "
           @search_for_text += "LOWER(projects_projects.name) LIKE '%"+@search_for.downcase+"%' )"
        end

        filter_text = ""
        @filter.each { |key ,value|
          if value == "true" 
            if filter_text.size > 0
                filter_text += " OR "
            end 
            filter_text += "projects.status = "+key
          end
        }

        @projects = Project.find(:all, :include => [:company, :user, :project], :conditions => "projects.deleted is null AND ("+ filter_text+")"+ @search_for_text).sort_by {|u| u.project_name.downcase}
      
    session[:activePage] = "menu_project"
    @activePage = session[:activePage]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
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

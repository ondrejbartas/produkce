class ProjectsController < ApplicationController


  # GET /projects/render_sub_project
  def render_sub_project
    unless params[:project_id].blank?
      @project = Project.find_by_id(params[:project_id])
    end
    render(:layout=>false)
  end
 # GET /projects/render_project
  def render_project
    unless params[:company_id].blank?
      @company = Company.find_by_id(params[:company_id])
    end
    render(:layout=>false)
  end

  # GET /projects/render_index
  def render_index
    unless params[:id].blank?
      @user = User.find_by_id(params[:id])
      @company = @user.company
    end
    render(:layout=>false)
  end

  # GET /projects
  # GET /projects.xml
  def index
  
    redirect_to ( :action => "list")
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])
        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @project }
        end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
  
     @project = Project.new

     if params[:project_id]
      @project_main = Project.find_by_id(params[:project_id])
     elsif params[:company_id]
      @company = Company.find_by_id(params[:company_id])
     else
      @companies = Company.find(:all, :conditions=> "deleted is null").sort_by {|u| u.name.downcase}
     end
      
     
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @project }
      end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
  
  
      if params[:project_id]
        @project_main = Project.find_by_id(params[:project_id])
      elsif params[:company_id]
        @company = Company.find_by_id(params[:company_id])
      else
        @companies = Company.find(:all, :conditions=> "deleted is null").sort_by {|u| u.name.downcase}
      end
      
      @project = Project.new(params[:project])

      if !params[:user_id].blank?
        @user = User.find(params[:user_id])
      else
        @users = User.find( :all , :conditions => ["deleted is null AND role % :rol = 0 ", {:rol => Role.find_by_name("CLIENT").getidd}]).sort_by {|u| u.name.downcase}
      end

      respond_to do |format|
        if @project.save
          flash[:notice] = 'Project was successfully created.'
          format.html { redirect_to(@project) }
          format.xml  { render :xml => @project, :status => :created, :location => @project }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
        end
      end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
      @project = Project.find(params[:id])

      respond_to do |format|
        if @project.update_attributes(params[:project])
          flash[:notice] = 'Project was successfully updated.'
          format.html { redirect_to(@project) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
        end
      end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
  
      @project = Project.find(params[:id])
      @project.destroy
      if @project.deleted
        @project.deleted = false
      else
        @project.deleted = true
      end
      @project.save

      respond_to do |format|
        format.html { redirect_to(projects_url) }
        format.xml  { head :ok }
      end
    end
    
    
    def list


       if params[:filter].blank? 
           @filter = { "0" => "true", "1" => "true" }
        else
           @filter = params[:filter]
        end

       if params[:query].blank? 
          @search_for = ""
          @search_for_text =""
       else
          @search_for = "%#{params[:query]}%"
          @search_for_text = " AND ( LOWER(companies.name) LIKE '%"+@search_for.downcase+"%' OR "
          @search_for_text += "LOWER(projects.note) LIKE '%"+@search_for.downcase+"%' OR "
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
         if params["sort"].blank?
           params["sort"] = "name"
         end

       sort = case params['sort']
              when "name"  then "name"
              when "name_reverse"  then "name_reverse"
              when "company"  then "companies.name"
              when "company_reverse"  then "companies.name DESC"
              when "date"  then "projects.created_at"
              when "date_reverse"  then "projects.created_at DESC"
              when "status"  then "projects.status"
              when "status_reverse"  then "projects.status DESC"
              end

       
       conditions = [ "projects.deleted is null"+@search_for_text+" "]

       if sort == "name"
         @projects = Project.find(:all, :include => [:company, :user, :project], :conditions => "projects.deleted is null  AND ("+ filter_text+")"+ @search_for_text).sort_by {|u| u.project_name.downcase}
       elsif sort == "name_reverse"
         @projects = Project.find(:all, :include => [:company, :user, :project], :conditions => "projects.deleted is null  AND ("+ filter_text+")"+ @search_for_text).sort_by {|u| u.project_name.downcase}.reverse
       else
         @projects = Project.find(:all, :include => [:company, :user, :project], :conditions => "projects.deleted is null  AND ("+ filter_text+")"+ @search_for_text, :order => sort)
       end

       if request.xml_http_request?
         render :partial => "items_list", :layout => false
       end

     end
    
end

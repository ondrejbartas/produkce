class PlanWorksController < ApplicationController
  # GET /works
  # GET /works.xml
  def index
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @works }
      end
  end
  
  def index_without_project
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @works }
      end
  end

  # GET /plan_works/1/edit
  def edit
    @plan_work = Work.find(params[:id])
    if params[:add_operation].blank? 
      @add_operation = false
      @operation_types = @plan_work.job_type.operation_types
    else 
      @add_operation = true
      @operation_types = OperationType.find(:all)
    end
    @job_type = @plan_work.job_type
    
  end
  
  # GET /plan_works/1/edit
  def edit_without_project
    @plan_work = Work.find(params[:id])
    @projects = Project.find(:all , :conditions => ["status = 1 AND project_id IS null"])

  end
  
  def add_place_finished_operation
       if not params[:job_type_id].blank?
        @job_type = JobType.find_by_id(params[:job_type_id])
        @operation_types =@job_type.operation_types
        @places =@job_type.places
        render(:layout=>false)
     else
         render  :inline =>"chyba při zadávání! Nechte si znovu stránku načíst."
     end   
  end

  def add_operation_type_parameters
     if not params[:operation_type_id].blank?
        @operation_type = OperationType.find_by_id(params[:operation_type_id])
        @cas = params[:cas]
        render(:layout=>false)
     else
         render  :inline =>"chyba při zadávání! Nechte si znovu stránku načíst."
     end
  end


  def add_user_operation
      if not params[:job_type_id].blank?
         @job_type = JobType.find_by_id(params[:job_type_id])
         if params[:chosed_role].blank?
            @chosed_role = 5
         else
            @chosed_role = params[:chosed_role]
         end
         if params[:plan_type].blank?
            @plan_type = "plan"
         elsif params[:plan_type] == "plan"
            @plan_type = params[:plan_type]
         elsif params[:plan_type] == "now"
            @plan_type = params[:plan_type]
            @places = @job_type.places
         end
         @operation_types = @job_type.operation_types
         render(:layout=>false)
      else
         render  :inline =>"chyba při zadávání! Nechte si znovu stránku načíst."
      end

  end

  def add_operation
      if not params[:job_type_id].blank?

         @operation_types = JobType.find_by_id(params[:job_type_id]).operation_types
         @place_id = params[:place_id]
         @date = params[:date]
         render(:layout=>false)
      else
         render  :inline =>"chyba při zadávání! Nechte si znovu stránku načíst."
      end

  end

  def add_finished_operation
      if not params[:job_type_id].blank?
         @operation_types = JobType.find_by_id(params[:job_type_id]).operation_types
         render(:layout=>false)
      else
         render  :inline =>"chyba při zadávání! Nechte si znovu stránku načíst."
      end

  end
 


  def add_user
      if not params[:job_type_id].blank?
         @job_type = JobType.find_by_id(params[:job_type_id])
         if params[:chosed_role].blank?
            @chosed_role = 5
         else
            @chosed_role = params[:chosed_role]
         end
         @plan_type = params[:plan_type]
         render(:layout=>false)
      else
         render  :inline =>"chyba při zadávání! Nechte si znovu stránku načíst."
      end

  end


  def add_calendar
      if not params[:job_type_id].blank?
         @job_type = JobType.find_by_id(params[:job_type_id])
         @user = User.find_by_id(params[:user_id])
         if params[:sub_project_id].blank?
            @project = Project.find_by_id(params[:project_id])
         else
            @project = Project.find_by_id(params[:sub_project_id])
         end

         if not params[:start_date].blank?
            @start_date = params[:start_date].to_i
            session[:calendar_start_date] = @start_date
         elsif not params['add_week'].blank?
            session[:calendar_start_date] += 7
            @start_date = session[:calendar_start_date]
         end
         render(:layout=>false)
      else
         render  :inline =>"chyba při zadávání! Nechte si znovu stránku načíst."
      end

  end

  def add_edit_calendar
      if not params[:work_id].blank?
         @plan_work = Work.find_by_id(params[:work_id])
         @job_type = @plan_work.job_type
         @user = User.find_by_id(params[:user_id])
         @project = @plan_work.project
         
         if not params[:place_id].blank? && params[:date].blank?
            @plan_work.place_id =params[:place_id]
            @plan_work.date = Time.parse(params[:date])
            @plan_work.time = Time.parse(params[:date])
            @plan_work.save
         end


         if not params[:start_date].blank?
            @start_date = params[:start_date].to_i
            session[:calendar_start_date] = @start_date
            session[:calendar_end_date] = @start_date
         elsif not params['add_week'].blank?
            session[:calendar_start_date] += 7
            @start_date = session[:calendar_start_date]
         elsif not params['substract_week'].blank?
            session[:calendar_end_date] -= 7
            @start_date = session[:calendar_end_date]
         elsif not params[:date].blank?
            @start_date = 0
         end
         render(:layout=>false)
      else
         render  :inline =>"chyba při zadávání! Nechte si znovu stránku načíst."
      end

  end

  def add_date
     @place_id = params[:place_id]
     @date = params[:date]
     render(:layout=>false)
  end


  def add_edit_date
     @place = Place.find_by_id(params[:place_id])
     @date = Time.parse(params[:date])
     render(:layout=>false)
  end
  # GET /works/1
  # GET /works/1.xml
  def show

      @plan_work = Work.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @work }
      end
  end

  # GET /works/new_now
  # GET /works/new_now.xml
  def new_now

      @plan_work = Work.new
      @plan_work.operations.build

      if not params[:project_id].blank?
         @plan_work.project_id = params[:project_id]
      end


      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @work }
      end
  end

   # GET /works/new_without_produce
  # GET /works/new_without_produce.xml
  def new_without_produce

      @plan_work = Work.new
      @plan_work.operations.build

      if not params[:project_id].blank?
         @plan_work.project_id = params[:project_id]
      end


      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @work }
      end
  end


  # GET /works/new
  # GET /works/new.xml
  def new

      @plan_work = Work.new
      @plan_work.operations.build

      if not params[:project_id].blank?
         @plan_work.project_id = params[:project_id] 
      end

     
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @work }
      end
  end

  # POST /works
  # POST /works.xml
  def create

      for day in params[:days]
         params[:work][:length] = day[:length]
         params[:work][:time] = Time.parse(day[:date]) + day[time].to_i.minutes
         params[:work][:place_id] = day[:place_id]
         params[:work][:reserved] = day[:reserved]

         @plan_work = Work.new(params[:work])
         @operations = @plan_work.operations
         if not @current_user.admin? || @current_user.produce?
             @plan_work.edited = true;
         end
         @plan_work.save

      end
      
      respond_to do |format|
        if @plan_work.save
          flash[:notice] = 'Work was successfully created.'
          format.html { redirect_to(@plan_work.project) }
        else
          format.html { render :action => "new" }
        end
      end
  end

  # PUT /works/1
  # PUT /works/1.xml
  def update
      @plan_work = Work.find(params[:id])
      @operations = @plan_work.operations

      if not @current.user.admin? || @current_user.produce?
          @plan_work.edited = true;
      end

      respond_to do |format|
        if @work.attributes(params[:work])
          if params['add_operation'].blank?
              flash[:notice] = 'Work was successfully updated.aa'+params['add_operation']
              format.html { redirect_to(@work) }
              format.xml  { head :ok }
            else
              redirect_to menu_home_path
          end
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @work.errors, :status => :unprocessable_entity }
        end
      end
  end

  # DELETE /works/1
  # DELETE /works/1.xml
  def destroy
    @plan_work = Work.find(params[:id])

     if @plan_work.deleted
        @plan_work.deleted = false
      else
        @plan_work.deleted = true
      end

      @plan_work.save

      respond_to do |format|
        format.html { redirect_to(@plan_work.project) }
        format.xml  { head :ok }
      end
  end

end

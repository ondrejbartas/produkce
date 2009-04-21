class WorksController < ApplicationController
  # GET /works
  # GET /works.xml
  def index
    @works = Work.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @works }
    end
  end

  # GET /works/1
  # GET /works/1.xml
  def show
    @work = Work.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @work }
    end
  end

  # GET /works/new
  # GET /works/new.xml
  def new
    @work = Work.new
    
    if not params[:project_id].blank?
         @work.project_id = params[:project_id]
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work }
    end
  end

  # GET /works/1/edit
  def edit
    @work = Work.find(params[:id])
    
  end

  # POST /works
  # POST /works.xml
  def create
    flash[:notice] = ""
    saved = true
    if !params[:days].blank?
        params[:days].each { |key ,day|
          params[:work][:length] = day[:length].to_i
          params[:work][:time] = Time.parse(day[:date]) + day[:time].to_i.minutes
          params[:work][:place_id] = day[:place_id]
          params[:work][:reserved] = day[:reserved]
          @work = Work.new(params[:work])
          if !@work.save
            @work_error = @work
            saved = false
          else
            flash[:notice] +="provedeno naplanovani prace na cas: "+ params[:work][:time].strftime("%H:%M %d.%m.%Y")+"<br />" 
            day[:date] = ""
          end
        }
    else 
      @work = Work.new(params[:work])
      if !@work.save
        @work_error = @work
        saved = false  
      end
    end

    @work = @work_error
    respond_to do |format|
      if saved == true
        flash[:notice] = 'Work was successfully created.'
        format.html { redirect_to :controller => "plans", :action => "week" }
        format.xml  { render :xml => @work, :status => :created, :location => @work }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.xml
  def update
    @work = Work.find(params[:id])


    respond_to do |format|
      if @work.update_attributes(params[:work])
        flash[:notice] = 'Work was successfully updated.'
        if !params[:add_operation_from_user].blank?
          format.html { redirect_to :controller => "account", :action => "menu_home" }
          format.xml  { head :ok }
        else
          format.html { redirect_to :controller => "plans", :action => "week" }
          format.xml  { head :ok }
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
    @work = Work.find(params[:id])
    @work.destroy

    respond_to do |format|
      format.html { redirect_to(works_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def add_operation
      if !params[:job_type_id].blank?
        if params[:job_type_id] == "0"
          @operation_types = OperationType.find(:all)
        else 
          @job_type = JobType.find(params[:job_type_id])
          @operation_types = @job_type.operation_types
        end
      end
      if !params[:from_user].blank? 
        @from_user = true
      end
      render(:layout=>false)                  
  end
  
  def add_operation_from_user
      @from_user = true
      @work = Work.find(params[:id])
  end
  
  
  def add_user
    
     if not params[:job_type_id].blank?
         @job_type = JobType.find_by_id(params[:job_type_id])
         if params[:chosed_role].blank?
            @chosed_role = 5
         else
            @chosed_role = params[:chosed_role]
         end
        if params[:change_user].blank?
             @change_user = false
          else
             @change_user = params[:change_user]
          end
          
            if params[:type_create].blank?
                 @type_create = false
              else
                 @type_create = params[:type_create]
              end
         @user_id = "0"
         @plan_type = params[:plan_type]
         render(:layout=>false)
      else
         render  :inline =>"chyba při zadávání! Nechte si znovu stránku načíst."
      end
  end
end

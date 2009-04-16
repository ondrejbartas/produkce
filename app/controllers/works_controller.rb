class WorksController < ApplicationController
  # GET /works
  # GET /works.xml
  def index
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
      @work.operations.build


      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @work }
      end
  end

  # POST /works
  # POST /works.xml
  def create

     saved = false
     if not (params[:days].blank? || params[:work].blank?)
        params[:days].each { |key ,day|
           if day[:length] != "0"
               @plan_work = Work.new(
                  :length => day[:length],
                  :time => Time.parse(day[:date]) + day[:time].to_i.minutes,
                  :place_id => day[:place_id],
                  :reserved => day[:reserved],
                  :sub_project_id => params[:work][:sub_project_id],
                  :project_id => params[:work][:project_id],
                  :user_id => params[:work][:user_id],
                  :job_type_id => params[:work][:job_type_id]
               )
               @plan_work.update_attributes(params[:work])

               @operations = @plan_work.operations
               if not @current_user.admin? || @current_user.produce?
                   @plan_work.edited = true;
               end

               if @plan_work.save
                  saved = true
               end
           end

        }
     end

      respond_to do |format|
        if  saved
          flash[:notice] = 'Work was successfully created.'
          if @plan_work.project_id.blank?
             format.html { redirect_to(@current_user)}
          else
            format.html { redirect_to(@plan_work.project) }
          end
          format.xml  { render :xml => @plan_work, :status => :created, :location => @work }
        else
          format.html { redirect_to :controller => "plan_works", :action => "new" }
          format.xml  { render :xml => @plan_work.errors, :status => :unprocessable_entity }
        end
      end
  end

  # PUT /works/1
  # PUT /works/1.xml
  def update
      @work = Work.find(params[:id])
      if params[:work][:without_project].blank? 
          @work.attributes = params[:work]
          @work.time = Time.parse(params[:work][:date]) + params[:work][:time].to_i.minutes

          @operations = @work.operations
      else 
        @work.project_id = params[:work][:project_id]
        @work.sub_project_id = params[:work][:sub_project_id]
      end
      if not @current_user.admin? || @current_user.produce?
          @work.edited = true;
      end
      
      respond_to do |format|
        if @work.save
           if params['add_operation'].blank?
                flash[:notice] = 'Work was successfully updated.'
                format.html { redirect_to(@work.project) }
                format.xml  { head :ok }
           else
             flash[:notice] = 'Work was successfully updated.'
             format.html { redirect_to(menu_home_path) }
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

     if @work.deleted
        @work.deleted = false
      else
        @work.deleted = true
      end

      @work.save

      respond_to do |format|
        format.html { redirect_to(works_url) }
        format.xml  { head :ok }
      end
  end
end

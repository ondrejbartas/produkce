class JobTypesController < ApplicationController
  # GET /job_types
  # GET /job_types.xml
  def index
      @job_types = JobType.find(:all, :conditions => "deleted is null").sort_by {|u| u.name.downcase}

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @job_types }
      end
  end

  # GET /job_types/1
  # GET /job_types/1.xml
  def show
      @job_type = JobType.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @job_type }
      end
  end

  # GET /job_types/new
  # GET /job_types/new.xml
  def new
      @job_type = JobType.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @job_type }
      end
  end

  # GET /job_types/1/edit
  def edit
      @job_type = JobType.find(params[:id])
  end

  # POST /job_types
  # POST /job_types.xml
  def create
      @job_type = JobType.new(params[:job_type])

      respond_to do |format|
        if @job_type.save
          flash[:notice] = 'JobType was successfully created.'
          format.html { redirect_to job_types_path }
          format.xml  { render :xml => @job_type, :status => :created, :location => @job_type }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @job_type.errors, :status => :unprocessable_entity }
        end
      end
  end

  # PUT /job_types/1
  # PUT /job_types/1.xml
  def update
    @job_type = JobType.find(params[:id])
      respond_to do |format|
        if @job_type.update_attributes(params[:job_type])
          flash[:notice] = 'JobType was successfully updated.'
          format.html { redirect_to job_types_path }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @job_type.errors, :status => :unprocessable_entity }
        end
      end
  end

  # DELETE /job_types/1
  # DELETE /job_types/1.xml
  def destroy
    if not (@current_user.admin?)
      flash[:error] = 'Nemáte oprávnění vidět danou stránku! Pokud si myslíte, že je to chyba napište administrátorovi: ondrej.bartas@pokrok.com'
      redirect_to @current_user
    else
      @job_type = JobType.find(params[:id])
       if @job_type.deleted
        @job_type.deleted = false
      else
        @job_type.deleted = true
      end
      @job_type.save
      respond_to do |format|
        format.html { redirect_to(job_types_url) }
        format.xml  { head :ok }
      end
    end
  end
end

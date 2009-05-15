class ProjectPathsController < ApplicationController
  # GET /project_paths
  # GET /project_paths.xml
  def index
    @project_paths = ProjectPath.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_paths }
    end
  end

  # GET /project_paths/1
  # GET /project_paths/1.xml
  def show
    @project_path = ProjectPath.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_path }
    end
  end

  # GET /project_paths/new
  # GET /project_paths/new.xml
  def new
    @project_path = ProjectPath.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_path }
    end
  end

  # GET /project_paths/1/edit
  def edit
    @project_path = ProjectPath.find(params[:id])
  end

  # POST /project_paths
  # POST /project_paths.xml
  def create
    @project_path = ProjectPath.new(params[:project_path])

      if @project_path.save
        flash[:notice] = 'ProjectPath was successfully created.'
        redirect_to session['saved_location']
      else
        redirect_to session['saved_location']
      end

  end

  # PUT /project_paths/1
  # PUT /project_paths/1.xml
  def update
    @project_path = ProjectPath.find(params[:id])

    respond_to do |format|
      if @project_path.update_attributes(params[:project_path])
        flash[:notice] = 'ProjectPath was successfully updated.'
        format.html { redirect_to(@project_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_path.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_paths/1
  # DELETE /project_paths/1.xml
  def destroy
    @project_path = ProjectPath.find(params[:id])
    @project_path.destroy

    respond_to do |format|
      format.html { redirect_to(project_paths_url) }
      format.xml  { head :ok }
    end
  end
end

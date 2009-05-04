class UpdateLogsController < ApplicationController
  # GET /update_logs
  # GET /update_logs.xml
  def index
    @update_logs = UpdateLog.all.sort_by {|u| u.created_at}.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @update_logs }
    end
  end

  # GET /update_logs/1
  # GET /update_logs/1.xml
  def show
    @update_log = UpdateLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @update_log }
    end
  end

  # GET /update_logs/new
  # GET /update_logs/new.xml
  def new
    @update_log = UpdateLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @update_log }
    end
  end

  # GET /update_logs/1/edit
  def edit
    @update_log = UpdateLog.find(params[:id])
  end

  # POST /update_logs
  # POST /update_logs.xml
  def create
    @update_log = UpdateLog.new(params[:update_log])

    respond_to do |format|
      if @update_log.save
        flash[:notice] = 'UpdateLog was successfully created.'
        format.html { redirect_to(update_logs_path) }
        format.xml  { render :xml => @update_log, :status => :created, :location => @update_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @update_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /update_logs/1
  # PUT /update_logs/1.xml
  def update
    @update_log = UpdateLog.find(params[:id])

    respond_to do |format|
      if @update_log.update_attributes(params[:update_log])
        flash[:notice] = 'UpdateLog was successfully updated.'
        format.html { redirect_to(@update_log) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @update_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /update_logs/1
  # DELETE /update_logs/1.xml
  def destroy
    @update_log = UpdateLog.find(params[:id])
    @update_log.destroy

    respond_to do |format|
      format.html { redirect_to(update_logs_url) }
      format.xml  { head :ok }
    end
  end
end

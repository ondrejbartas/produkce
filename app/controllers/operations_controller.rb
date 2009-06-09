class OperationsController < ApplicationController
  # GET /operations
  # GET /operations.xml
  def index
    @operations = Operation.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @operations }
    end
  end

  # GET /operations/1
  # GET /operations/1.xml
  def show
    @operation = Operation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @operation }
    end
  end

  # GET /operations/new
  # GET /operations/new.xml
  def new
    @operation = Operation.new
    @work = Work.find_by_id(params[:work_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @operation }
    end
  end

  # GET /operations/1/edit
  def edit
    @operation = Operation.find(params[:id])
    if (not params[:finished].blank?) && params[:finished] == "repair"
      @operation.finished = false
      @operation.save
    end
  end

  # POST /operations
  # POST /operations.xml
  def create
    @operation = Operation.new(params[:operation])

    respond_to do |format|
      if @operation.save
        flash[:notice] = 'Operation was successfully created.'
        format.html { redirect_to(@operation) }
        format.xml  { render :xml => @operation, :status => :created, :location => @operation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @operation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /operations/1
  # PUT /operations/1.xml
  def update
    @operation = Operation.find(params[:id])

    if !params[:work].blank? 
      @work = Work.find(@operation.work_id, :conditions => ['deleted is null'])
      @work.update_attributes(params[:work])
    end
    respond_to do |format|
      if @operation.update_attributes(params[:operation])
        flash[:notice] = 'Operation was successfully updated.'
        format.html { redirect_to session['saved_location'] }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @operation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1
  # DELETE /operations/1.xml
  def destroy
    @operation = Operation.find(params[:id])
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to(operations_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def add_operation_type_parameters
       if !params[:operation_type_id].blank?
           @operation_type = OperationType.find(params[:operation_type_id])
       end
       @index = params[:index]
       render(:layout=>false)                  
   end
end

class OperationTypesController < ApplicationController
  # GET /operation_types
  # GET /operation_types.xml
  def index
    @operation_types = OperationType.find(:all).sort_by {|u| u.name.downcase}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @operation_types }
    end
  end

  # GET /operation_types/1
  # GET /operation_types/1.xml
  def show
    @operation_type = OperationType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @operation_type }
    end
  end

  # GET /operation_types/new
  # GET /operation_types/new.xml
  def new
    @operation_type = OperationType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @operation_type }
    end
  end

  # GET /operation_types/1/edit
  def edit
    @operation_type = OperationType.find(params[:id])
  end

  # POST /operation_types
  # POST /operation_types.xml
  def create
    @operation_type = OperationType.new(params[:operation_type])

    respond_to do |format|
      if @operation_type.save
        flash[:notice] = 'OperationType was successfully created.'
        format.html { redirect_to(operation_types_url) }
        format.xml  { render :xml => @operation_type, :status => :created, :location => @operation_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @operation_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /operation_types/1
  # PUT /operation_types/1.xml
  def update
    @operation_type = OperationType.find(params[:id])

    respond_to do |format|
      if @operation_type.update_attributes(params[:operation_type])
        flash[:notice] = 'OperationType was successfully updated.'
        format.html {redirect_to(operation_types_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @operation_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /operation_types/1
  # DELETE /operation_types/1.xml
  def destroy
    @operation_type = OperationType.find(params[:id])
    @operation_type.destroy

    respond_to do |format|
      format.html { redirect_to(operation_types_url) }
      format.xml  { head :ok }
    end
  end
end

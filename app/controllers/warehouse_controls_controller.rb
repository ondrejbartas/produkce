class WarehouseControlsController < ApplicationController
  # GET /warehouse_controls
  # GET /warehouse_controls.xml
  def index
    @warehouse_controls = WarehouseControl.find(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warehouse_controls }
    end
  end

  def show_discarded_tapes
    operation_type = OperationType.find(:all, :conditions => ["value = 6"]).first
    @operations = Operation.find(:all, :conditions => ["operation_type_id = "+operation_type.id.to_s], :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warehouse_controls }
    end
  end

  def show_used_tapes
    operation_types = OperationType.find(:all, :conditions => ["value = 3 OR value = 4 "])
    
    conditions = ""
    for operation_type in operation_types 
        conditions += " OR " if conditions.size > 4
        conditions += "operation_type_id = "+operation_type.id.to_s
    end
    conditions = "finished = true AND ("+conditions +")"
    @operations = Operation.find(:all, :conditions => conditions, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warehouse_controls }
    end
  end

  def show_sold_tapes
     operation_type = OperationType.find(:all, :conditions => ["value = 5"]).first
     @operations = Operation.find(:all, :conditions => ["operation_type_id = "+operation_type.id.to_s], :order => "created_at DESC")

     @tape_sells = TapeSell.find(:all ,:order => "created_at DESC")
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @warehouse_controls }
     end
  end
   
  # GET /warehouse_controls/1
  # GET /warehouse_controls/1.xml
  def show
    @warehouse_control = WarehouseControl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warehouse_control }
    end
  end

  # GET /warehouse_controls/new
  # GET /warehouse_controls/new.xml
  def new
    @warehouse_control = WarehouseControl.new
    @warehouse_control.missing_tapes.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warehouse_control }
    end
  end

  # GET /warehouse_controls/1/edit
  def edit
    @warehouse_control = WarehouseControl.find(params[:id])
  end

  # POST /warehouse_controls
  # POST /warehouse_controls.xml
  def create
    @warehouse_control = WarehouseControl.new(params[:warehouse_control])

    respond_to do |format|
      if @warehouse_control.save
        flash[:notice] = 'WarehouseControl was successfully created.'
        format.html { redirect_to warehouse_controls_path }
        format.xml  { render :xml => @warehouse_control, :status => :created, :location => @warehouse_control }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @warehouse_control.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /warehouse_controls/1
  # PUT /warehouse_controls/1.xml
  def update
    @warehouse_control = WarehouseControl.find(params[:id])
    @warehouse_control.attributes = params[:project]

    respond_to do |format|
      if @warehouse_control.update_attributes(params[:warehouse_control])
        flash[:notice] = 'WarehouseControl was successfully updated.'
        format.html { redirect_to warehouse_controls_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warehouse_control.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouse_controls/1
  # DELETE /warehouse_controls/1.xml
  def destroy
    @warehouse_control = WarehouseControl.find(params[:id])
    @warehouse_control.missing_tapes.destroy
    @warehouse_control.destroy

    respond_to do |format|
      format.html { redirect_to(warehouse_controls_url) }
      format.xml  { head :ok }
    end
  end
end

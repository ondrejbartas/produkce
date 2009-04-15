class InvoiceOperationsController < ApplicationController
  # GET /invoice_operations
  # GET /invoice_operations.xml
  def index
    @invoice_operations = InvoiceOperation.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoice_operations }
    end
  end

  # GET /invoice_operations/1
  # GET /invoice_operations/1.xml
  def show
    @invoice_operation = InvoiceOperation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice_operation }
    end
  end

  # GET /invoice_operations/new
  # GET /invoice_operations/new.xml
  def new
    @invoice_operation = InvoiceOperation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice_operation }
    end
  end

  # GET /invoice_operations/1/edit
  def edit
    @invoice_operation = InvoiceOperation.find(params[:id])
  end

  # POST /invoice_operations
  # POST /invoice_operations.xml
  def create
    @invoice_operation = InvoiceOperation.new(params[:invoice_operation])

    respond_to do |format|
      if @invoice_operation.save
        flash[:notice] = 'InvoiceOperation was successfully created.'
        
        format.html { redirect_to :invoice_operations }
        format.xml  { render :xml => @invoice_operation, :status => :created, :location => @invoice_operation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice_operation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoice_operations/1
  # PUT /invoice_operations/1.xml
  def update
    @invoice_operation = InvoiceOperation.find(params[:id])

    respond_to do |format|
      if @invoice_operation.update_attributes(params[:invoice_operation])
        flash[:notice] = 'InvoiceOperation was successfully updated.'
        format.html { redirect_to :invoice_operations }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice_operation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_operations/1
  # DELETE /invoice_operations/1.xml
  def destroy
    @invoice_operation = InvoiceOperation.find(params[:id])
    @invoice_operation.destroy

    respond_to do |format|
      format.html { redirect_to(invoice_operations_url) }
      format.xml  { head :ok }
    end
  end
end

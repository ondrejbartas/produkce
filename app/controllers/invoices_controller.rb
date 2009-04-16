class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.xml
  def index
    @invoices = Invoice.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.xml
  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.xml
  def new
    @invoice = Invoice.new
    if not params[:project_id].blank?
      @project = Project.find_by_id(params[:project_id])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.xml
  def create
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        flash[:notice] = 'Invoice was successfully created.'
        format.html { redirect_to(@invoice) }
        format.xml  { render :xml => @invoice, :status => :created, :location => @invoice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.xml
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        flash[:notice] = 'Invoice was successfully updated.'
        format.html { redirect_to(@invoice) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.xml
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to(invoices_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def finished_projects

     @filter = { "2" => "true" }
    filter_text =""
     @filter.each { |key ,value|
       if value == "true" 
         if filter_text.size > 0
             filter_text += " OR "
         end 
         filter_text += "projects.status = "+key
       end
     }

     @projects = Project.find(:all, :conditions => "projects.deleted is null AND ("+ filter_text+")").sort_by {|u| u.project_name.downcase}
      if not (@current_user.admin? || @current_user.produce? || @current_user.worker?)
           flash[:error] = 'Nemáte oprávnění vidět danou stránku! Pokud si myslíte, že je to chyba napište administrátorovi: ondrej.bartas@pokrok.com'
           redirect_to @current_user
      else

         respond_to do |format|
           format.html # index.html.erb
           format.xml  { render :xml => @projects }
         end
     end
   end
  
end

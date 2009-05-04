class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.xml
  def index
  
    redirect_to ( :action => "list")
    
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
         @company = Company.find(params[:id])

       respond_to do |format|
         format.html # show.html.erb
         format.xml  { render :xml => @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
       @company = Company.new

       respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @company }
       end
  end

  # GET /companies/1/edit
  def edit
       @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.xml
  def create
       @company = Company.new(params[:company])
       if !params[:contact][:phone].blank?
        @company.contacts.build(params[:contact])
        @contacts = Contact.new(params[:contact])

      end

       respond_to do |format|
         if @company.save
           flash[:notice] = 'Company was successfully created.'
           format.html { redirect_to :companies }
           format.xml  { render :xml => @company, :status => :created, :location => @company }
         else
           @contacts = @user.contacts
           format.html { render :action => "new" }
           format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
         end
      end
   end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
       @company = Company.find(params[:id])

       respond_to do |format|
         if @company.update_attributes(params[:company])
           flash[:notice] = 'Company was successfully updated.'
           format.html { redirect_to(@company) }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
         end
       end
   end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy

      @company = Company.find(params[:id])
      if @company.deleted
        @company.deleted = false
      else
        @company.deleted = true
      end
      @company.save


       respond_to do |format|
         format.html { redirect_to(companies_url) }
         format.xml  { head :ok }
       end
    end
    
    
  def list
     if params[:query].blank? 
        @search_for = ""
        @search_for_text =""
     else
        @search_for = "%#{params[:query]}%"
        @search_for_text = " AND ( LOWER(companies.name) LIKE '%"+@search_for.downcase+"%' OR "
        @search_for_text += "LOWER(users.fullname) LIKE '%"+@search_for.downcase+"%' ) "
     end


       if params["sort"].blank?
         params["sort"] = "company"
       end

     sort = case params['sort']
            when "company"  then "companies.name"
            when "company_reverse"  then "companies.name DESC"
        end


     conditions = [ "companies.deleted is null "+@search_for_text]


     @companies = Company.find(:all, :include => [:users], :order => sort, :conditions => conditions)

     if request.xml_http_request?
       render :partial => "items_list", :layout => false
     end

   end

end

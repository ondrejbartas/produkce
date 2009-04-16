class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.xml
  def index
    @contacts = Contact.find(:all , :conditions => "deleted is null")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end

  # GET /contact/render_index/:id
  def render_index
    unless params[:id].blank?
      @user = User.find_by_id(params[:id])
    end
    render(:layout=>false)
  end
  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
   def new
    if not params[:user_id].blank?
      @user = User.find(params[:user_id])
      @contact =  @user.contacts.build
    elsif not params[:company_id].blank?
      @company = Company.find(params[:company_id])
      @contact =  @company.contacts.build
    end
 

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @contact }
      end
  end

  # GET /contacts/1/edit
  def edit
      @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    if not params[:contact][:user_id].blank?
      @user = User.find(params[:contact][:user_id])
    elsif not params[:contact][:company_id].blank?
      @company = Company.find(params[:contact][:company_id])
    end
    if not ( ( !@user.blank? && @current_user.id == @user.id) || @current_user.admin? || @current_user.produce? )
        flash[:error] = 'Nemáte oprávnění vidět danou stránku! Pokud si myslíte, že je to chyba napište administrátorovi: ondrej.bartas@pokrok.com'
        redirect_to @current_user
    else
      if not params[:contact][:user_id].blank?
         @contact = @user.contacts.build(params[:contact])
         if @user.save
           flash[:notice] = 'Kontakt byl úspěšně vytvořen.'
           redirect_to user_url(@user)
         else
           render :action => "new"
         end
      elsif not params[:contact][:company_id].blank?
         @contact = @company.contacts.build(params[:contact])
         if @company.save
           flash[:notice] = 'Kontakt byl úspěšně vytvořen.'
           redirect_to company_url(@company)
         else
           render :action => "new"
         end
      end


    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @contact = Contact.find(params[:id])
 

      respond_to do |format|
        if @contact.update_attributes(params[:contact])

          flash[:notice] = 'Kontakt byl úspěšně upraven.'
          format.html { redirect_to user_url(@contact.user) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
        end
      end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
   
      if @contact.deleted
        @contact.deleted = false
      else
        @contact.deleted = true
      end
      @contact.save

      if not @contact.user_id.blank?
         @user = User.find(params[:user_id])
         respond_to do |format|
           format.html { redirect_to user_url(@user) }
           format.xml  { head :ok }
         end
      elsif not @contact.company_id.blank?
         @company = Company.find(params[:company_id])
         respond_to do |format|
           format.html { redirect_to company_url(@company) }
           format.xml  { head :ok }
         end
      end
      
    end
end

class ReceptionContactsController < ApplicationController
  # GET /reception_contacts
  # GET /reception_contacts.xml
  def index
    @reception_contacts = ReceptionContact.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reception_contacts }
    end
  end

  # GET /reception_contacts/1
  # GET /reception_contacts/1.xml
  def show
    @reception_contact = ReceptionContact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reception_contact }
    end
  end

  # GET /reception_contacts/new
  # GET /reception_contacts/new.xml
  def new
    @reception_contact = ReceptionContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reception_contact }
    end
  end

  # GET /reception_contacts/1/edit
  def edit
    @reception_contact = ReceptionContact.find(params[:id])
  end

  # POST /reception_contacts
  # POST /reception_contacts.xml
  def create
    @reception_contact = ReceptionContact.new(params[:reception_contact])

    respond_to do |format|
      if @reception_contact.save
        flash[:notice] = 'ReceptionContact was successfully created.'
        format.html { redirect_to(reception_contacts_url) }
        format.xml  { render :xml => @reception_contact, :status => :created, :location => @reception_contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reception_contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reception_contacts/1
  # PUT /reception_contacts/1.xml
  def update
    @reception_contact = ReceptionContact.find(params[:id])

    respond_to do |format|
      if @reception_contact.update_attributes(params[:reception_contact])
        flash[:notice] = 'ReceptionContact was successfully updated.'
        format.html { redirect_to(reception_contacts_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reception_contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reception_contacts/1
  # DELETE /reception_contacts/1.xml
  def destroy
    @reception_contact = ReceptionContact.find(params[:id])
    @reception_contact.destroy

    respond_to do |format|
      format.html { redirect_to(reception_contacts_url) }
      format.xml  { head :ok }
    end
  end
end

class ReceptionCategoriesController < ApplicationController
  # GET /reception_categories
  # GET /reception_categories.xml
  def index
    @reception_categories = ReceptionCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reception_categories }
    end
  end

  # GET /reception_categories/1
  # GET /reception_categories/1.xml
  def show
    @reception_category = ReceptionCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reception_category }
    end
  end

  # GET /reception_categories/new
  # GET /reception_categories/new.xml
  def new
    @reception_category = ReceptionCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reception_category }
    end
  end

  # GET /reception_categories/1/edit
  def edit
    @reception_category = ReceptionCategory.find(params[:id])
  end

  # POST /reception_categories
  # POST /reception_categories.xml
  def create
    @reception_category = ReceptionCategory.new(params[:reception_category])

    respond_to do |format|
      if @reception_category.save
        flash[:notice] = 'ReceptionCategory was successfully created.'
        format.html { redirect_to(reception_categories_url) }
        format.xml  { render :xml => @reception_category, :status => :created, :location => @reception_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reception_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reception_categories/1
  # PUT /reception_categories/1.xml
  def update
    @reception_category = ReceptionCategory.find(params[:id])

    respond_to do |format|
      if @reception_category.update_attributes(params[:reception_category])
        flash[:notice] = 'ReceptionCategory was successfully updated.'
        format.html { redirect_to(reception_categories_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reception_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reception_categories/1
  # DELETE /reception_categories/1.xml
  def destroy
    @reception_category = ReceptionCategory.find(params[:id])
    @reception_category.destroy

    respond_to do |format|
      format.html { redirect_to(reception_categories_url) }
      format.xml  { head :ok }
    end
  end
end

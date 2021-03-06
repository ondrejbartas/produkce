class RightsController < ApplicationController
  # GET /rights
  # GET /rights.xml
  def index
    @rights = Right.all.sort_by {|u| u.controller.downcase}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rights }
    end
  end

  # GET /rights/1
  # GET /rights/1.xml
  def show
    @right = Right.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @right }
    end
  end

  # GET /rights/new
  # GET /rights/new.xml
  def new
    @right = Right.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @right }
    end
  end

  # GET /rights/1/edit
  def edit
    @right = Right.find(params[:id])
  end

  # POST /rights
  # POST /rights.xml
  def create
    @right = Right.new(params[:right])


    @right.value = 1
    if !params[:role3].blank? then @right.value *= 3 end
    if !params[:role5].blank? then @right.value *= 5 end
    if !params[:role7].blank? then @right.value *= 7 end
    if !params[:role11].blank? then @right.value *= 11 end
    if !params[:role13].blank? then @right.value *= 13 end
    if !params[:role17].blank? then @right.value *= 17 end
    if !params[:role23].blank? then @right.value *= 23 end
          
    respond_to do |format|
      if @right.save
        flash[:notice] = 'Right was successfully created.'
        format.html { redirect_to :controller => @right.controller }
        format.xml  { render :xml => @right, :status => :created, :location => @right }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @right.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rights/1
  # PUT /rights/1.xml
  def update
    @right = Right.find(params[:id])

    @right.value = 1
    if !params[:role3].blank? then @right.value *= 3 end
    if !params[:role5].blank? then @right.value *= 5 end
    if !params[:role7].blank? then @right.value *= 7 end
    if !params[:role11].blank? then @right.value *= 11 end
    if !params[:role13].blank? then @right.value *= 13 end
    if !params[:role17].blank? then @right.value *= 17 end
    if !params[:role23].blank? then @right.value *= 23 end

    respond_to do |format|
      if @right.update_attributes(params[:right])
        flash[:notice] = 'Right was successfully updated.'
        format.html { redirect_to rights_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @right.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rights/1
  # DELETE /rights/1.xml
  def destroy
    @right = Right.find(params[:id])
    @right.destroy

    respond_to do |format|
      format.html { redirect_to(rights_url) }
      format.xml  { head :ok }
    end
  end
end

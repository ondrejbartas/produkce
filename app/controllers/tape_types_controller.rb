class TapeTypesController < ApplicationController
  # GET /tape_types
  # GET /tape_types.xml
  def index
    @tape_types = TapeType.find(:all).sort_by {|u| u.order}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tape_types }
    end
  end

  # GET /tape_types/1
  # GET /tape_types/1.xml
  def show
    @tape_type = TapeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tape_type }
    end
  end

  # GET /tape_types/new
  # GET /tape_types/new.xml
  def new
    @tape_type = TapeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tape_type }
    end
  end

  # GET /tape_types/1/edit
  def edit
    @tape_type = TapeType.find(params[:id])
  end

  # POST /tape_types
  # POST /tape_types.xml
  def create
    @tape_type = TapeType.new(params[:tape_type])

    respond_to do |format|
      if @tape_type.save
        flash[:notice] = 'TapeType was successfully created.'
        format.html { redirect_to tape_types_path }
        format.xml  { render :xml => @tape_type, :status => :created, :location => @tape_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tape_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tape_types/1
  # PUT /tape_types/1.xml
  def update
    @tape_type = TapeType.find(params[:id])

    respond_to do |format|
      if @tape_type.update_attributes(params[:tape_type])
        flash[:notice] = 'TapeType was successfully updated.'
        format.html { redirect_to tape_types_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tape_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tape_types/1
  # DELETE /tape_types/1.xml
  def destroy
    @tape_type = TapeType.find(params[:id])
    @tape_type.destroy

    respond_to do |format|
      format.html { redirect_to(tape_types_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def render_price 
    @tape_type = TapeType.find(params[:tape_type_id])
    render :partial => "render_price", :layout => false    
  end
end

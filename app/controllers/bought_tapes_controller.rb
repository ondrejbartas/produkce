class BoughtTapesController < ApplicationController
  # GET /bought_tapes
  # GET /bought_tapes.xml
  def index
    @bought_tapes = BoughtTape.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bought_tapes }
    end
  end

  # GET /bought_tapes/1
  # GET /bought_tapes/1.xml
  def show
    @bought_tape = BoughtTape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bought_tape }
    end
  end

  # GET /bought_tapes/new
  # GET /bought_tapes/new.xml
  def new
    @bought_tape = BoughtTape.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bought_tape }
    end
  end

  # GET /bought_tapes/1/edit
  def edit
    @bought_tape = BoughtTape.find(params[:id])
  end

  # POST /bought_tapes
  # POST /bought_tapes.xml
  def create
    @bought_tape = BoughtTape.new(params[:bought_tape])

    respond_to do |format|
      if @bought_tape.save
        flash[:notice] = 'BoughtTape was successfully created.'
        format.html { redirect_to(@bought_tape) }
        format.xml  { render :xml => @bought_tape, :status => :created, :location => @bought_tape }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bought_tape.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bought_tapes/1
  # PUT /bought_tapes/1.xml
  def update
    @bought_tape = BoughtTape.find(params[:id])

    respond_to do |format|
      if @bought_tape.update_attributes(params[:bought_tape])
        flash[:notice] = 'BoughtTape was successfully updated.'
        format.html { redirect_to(@bought_tape) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bought_tape.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bought_tapes/1
  # DELETE /bought_tapes/1.xml
  def destroy
    @bought_tape = BoughtTape.find(params[:id])
    @bought_tape.destroy

    respond_to do |format|
      format.html { redirect_to(bought_tapes_url) }
      format.xml  { head :ok }
    end
  end
end

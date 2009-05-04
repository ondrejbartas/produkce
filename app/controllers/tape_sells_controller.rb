class TapeSellsController < ApplicationController
  # GET /tape_sells
  # GET /tape_sells.xml
  def index
    @tape_sells = TapeSell.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tape_sells }
    end
  end

  # GET /tape_sells/1
  # GET /tape_sells/1.xml
  def show
    @tape_sell = TapeSell.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tape_sell }
    end
  end

  # GET /tape_sells/new
  # GET /tape_sells/new.xml
  def new
    @tape_sell = TapeSell.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tape_sell }
    end
  end

  # GET /tape_sells/1/edit
  def edit
    @tape_sell = TapeSell.find(params[:id])
  end

  # POST /tape_sells
  # POST /tape_sells.xml
  def create
    params[:tape_sell][:user_id] =@current_user.id 
    @tape_sell = TapeSell.new(params[:tape_sell])

    respond_to do |format|
      if @tape_sell.save
        flash[:notice] = 'TapeSell was successfully created.'
        format.html { redirect_to(:controller=> "warehouse_controls", :action => "show_sold_tapes") }
        format.xml  { render :xml => @tape_sell, :status => :created, :location => @tape_sell }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tape_sell.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tape_sells/1
  # PUT /tape_sells/1.xml
  def update
    @tape_sell = TapeSell.find(params[:id])

    respond_to do |format|
      if @tape_sell.update_attributes(params[:tape_sell])
        flash[:notice] = 'TapeSell was successfully updated.'
        format.html { redirect_to(@tape_sell) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tape_sell.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tape_sells/1
  # DELETE /tape_sells/1.xml
  def destroy
    @tape_sell = TapeSell.find(params[:id])
    @tape_sell.destroy

    respond_to do |format|
      format.html { redirect_to(tape_sells_url) }
      format.xml  { head :ok }
    end
  end
end

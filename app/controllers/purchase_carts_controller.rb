class PurchaseCartsController < ApplicationController
  # GET /purchase_carts
  # GET /purchase_carts.xml
  def index
    @purchase_carts = PurchaseCart.find(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_carts }
    end
  end

  # GET /purchase_carts/1
  # GET /purchase_carts/1.xml
  def show
    @purchase_cart = PurchaseCart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_cart }
    end
  end

  # GET /purchase_carts/new
  # GET /purchase_carts/new.xml
  def new
    @purchase_cart = PurchaseCart.new
    @purchase_cart.bought_tapes.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_cart }
    end
  end

  # GET /purchase_carts/1/edit
  def edit
    @purchase_cart = PurchaseCart.find(params[:id])
    
  end

  # POST /purchase_carts
  # POST /purchase_carts.xml
  def create
    @purchase_cart = PurchaseCart.new(params[:purchase_cart])

    respond_to do |format|
      if @purchase_cart.save
        flash[:notice] = 'PurchaseCart was successfully created.'
        format.html { redirect_to(@purchase_cart) }
        format.xml  { render :xml => @purchase_cart, :status => :created, :location => @purchase_cart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_cart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchase_carts/1
  # PUT /purchase_carts/1.xml
  def update
    @purchase_cart = PurchaseCart.find(params[:id])
    @purchase_cart.attributes = params[:project]

    respond_to do |format|
      if @purchase_cart.update_attributes(params[:purchase_cart])
        flash[:notice] = 'PurchaseCart was successfully updated.'
        format.html { redirect_to(@purchase_cart) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase_cart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_carts/1
  # DELETE /purchase_carts/1.xml
  def destroy
    @purchase_cart = PurchaseCart.find(params[:id])
    @purchase_cart.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_carts_url) }
      format.xml  { head :ok }
    end
  end
end

class PlacesController < ApplicationController
  # GET /places
  # GET /places.xml
  def index

   
      @places = Place.find(:all , :conditions => "deleted is null")

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @places }
      end
   end

  # GET /places/1
  # GET /places/1.xml
  def show

   
      @place = Place.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @place }
      end
  end

  # GET /places/new
  # GET /places/new.xml
  def new

      @place = Place.new

      respond_to do |format|
        redirect_to(places_url)
      end
  end

  # GET /places/1/edit
  def edit

      @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.xml
  def create
      @place = Place.new(params[:place])

      respond_to do |format|
        if @place.save
          flash[:notice] = 'Place was successfully created.'
          format.html { redirect_to(places_url) }
          format.xml  { render :xml => @place, :status => :created, :location => @place }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
        end
      end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update

      @place = Place.find(params[:id])

      respond_to do |format|
        if @place.update_attributes(params[:place])
          flash[:notice] = 'Place was successfully updated.'
          format.html { redirect_to(places_url) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
        end
      end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy


      @place = Place.find(params[:id])
      if @place.deleted
        @place.deleted = false
      else
        @place.deleted = true
      end
      @place.save

      respond_to do |format|
        format.html { redirect_to(places_url) }
        format.xml  { head :ok }
      end
    end
end

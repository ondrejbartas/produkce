class ReceptionEventsController < ApplicationController
  # GET /reception_events
  # GET /reception_events.xml
  def index
    @reception_events = ReceptionEvent.find(:all, :order => '"from" DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reception_events }
    end
  end

  # GET /reception_events/1
  # GET /reception_events/1.xml
  def show
    @reception_event = ReceptionEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reception_event }
    end
  end

  # GET /reception_events/new
  # GET /reception_events/new.xml
  def new
    @reception_event = ReceptionEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reception_event }
    end
  end

  # GET /reception_events/1/edit
  def edit
    @reception_event = ReceptionEvent.find(params[:id])
  end

  # POST /reception_events
  # POST /reception_events.xml
  def create
    @reception_event = ReceptionEvent.new(params[:reception_event])

    respond_to do |format|
      if @reception_event.save
        flash[:notice] = 'ReceptionEvent was successfully created.'
        format.html { redirect_to(reception_events_url) }
        format.xml  { render :xml => @reception_event, :status => :created, :location => @reception_event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reception_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reception_events/1
  # PUT /reception_events/1.xml
  def update
    @reception_event = ReceptionEvent.find(params[:id])

    respond_to do |format|
      if @reception_event.update_attributes(params[:reception_event])
        flash[:notice] = 'ReceptionEvent was successfully updated.'
        format.html { redirect_to(reception_events_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reception_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reception_events/1
  # DELETE /reception_events/1.xml
  def destroy
    @reception_event = ReceptionEvent.find(params[:id])
    @reception_event.destroy

    respond_to do |format|
      format.html { redirect_to(reception_events_url) }
      format.xml  { head :ok }
    end
  end
end

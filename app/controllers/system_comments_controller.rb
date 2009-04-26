class SystemCommentsController < ApplicationController
  # GET /system_comments
  # GET /system_comments.xml
  def index
    @system_comments = SystemComment.find(:all).sort_by {|u| u.created_at}.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @system_comments }
    end
  end

  # GET /system_comments/1
  # GET /system_comments/1.xml
  def show
    @system_comment = SystemComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @system_comment }
    end
  end

  # GET /system_comments/new
  # GET /system_comments/new.xml
  def new
    @system_comment = SystemComment.new
    if !params[:system_comment_id].blank?
      @system_comment_id = params[:system_comment_id]
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @system_comment }
    end
  end

  # GET /system_comments/1/edit
  def edit
    @system_comment = SystemComment.find(params[:id])
  end

  # POST /system_comments
  # POST /system_comments.xml
  def create
    @system_comment = SystemComment.new(params[:system_comment])

    respond_to do |format|
      if @system_comment.save
        flash[:notice] = 'SystemComment was successfully created.'
        format.html { redirect_to(system_comments_url) }
        format.xml  { render :xml => @system_comment, :status => :created, :location => @system_comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @system_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /system_comments/1
  # PUT /system_comments/1.xml
  def update
    @system_comment = SystemComment.find(params[:id])

    respond_to do |format|
      if @system_comment.update_attributes(params[:system_comment])
        flash[:notice] = 'SystemComment was successfully updated.'
        format.html { redirect_to(system_comments_url)  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @system_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /system_comments/1
  # DELETE /system_comments/1.xml
  def destroy
    @system_comment = SystemComment.find(params[:id])
    @system_comment.destroy

    respond_to do |format|
      format.html { redirect_to(system_comments_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
  def add_form
      @system_comment = SystemComment.new
      if !params[:id].blank?
        @system_comment_id = params[:id]
      end
      render(:layout=>false)                  
   end
   
   def finished
       @system_comment = SystemComment.find(params[:id])
       @system_comment.finished = true
       @system_comment.save
       
       redirect_to(system_comments_url)
    end
    
    
     def storno
         @system_comment = SystemComment.find(params[:id])
         @system_comment.storno = true
         @system_comment.save

         redirect_to(system_comments_url)
     end
end
